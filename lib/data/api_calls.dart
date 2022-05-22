import 'dart:convert';
import 'dart:io';
import 'package:council_reporting/data/user_registration_info.dart';
import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart';

import 'db.dart';

final fakeUser = User(
  id: 1,
  deviceId: 'abc123def456ghi789k0',
  firstName: 'Test',
  lastName: 'User',
  mobile: '0499999999',
  points: 0,
);

const fakeValidOtp = true;
const fakingUser = false;

class Api {
  final DateTimeValueSerializer? _dateTimeSerializer = const DateTimeValueSerializer();
  Future<bool> userExist(String mobile) async {
    try {
      final response = await http.get(
        Uri.parse(
          'http://ec2-54-206-191-64.ap-southeast-2.compute.amazonaws.com/api/user?mobile=$mobile',
        ),
        headers: _getGetHeader(),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body).isNotEmpty;
      }
    } catch (e) {
      return false;
    }

    return false;
  }

  Future<void> requestOtp(String mobile, String? deviceId) async {
    try {
      await http.post(
        Uri.parse('http://ec2-54-206-191-64.ap-southeast-2.compute.amazonaws.com/api/trigger_otp'),
        headers: _getPostHeader(),
        body: jsonEncode(<String, dynamic>{
          'mobile': mobile,
          'deviceId': deviceId,
          'Trigger_DateTime': DateTime.now().toString(),
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<bool> validateOtp(String mobile, String otp) async {
    if (fakeValidOtp) {
      return true;
    }

    try {
      final response = await http.get(
        Uri.parse(
          'http://ec2-54-206-191-64.ap-southeast-2.compute.amazonaws.com/api/otp'
          '?'
          'mobile=$mobile'
          '&'
          'otp=$otp',
        ),
        headers: _getGetHeader(),
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }

    return false;
  }

  Future<User?> getUser(String mobile) async {
    try {
      final response = await http.get(
        Uri.parse(
          'http://ec2-54-206-191-64.ap-southeast-2.compute.amazonaws.com/api/user'
          '?'
          'mobile=$mobile',
        ),
        headers: _getGetHeader(),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body)[0], serializer: _dateTimeSerializer);
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  Future<User?> submitUserInfo(UserRegistrationInfo userInfo) async {
    if (fakingUser) {
      return fakeUser;
    }

    try {
      final response = await http.post(
        Uri.parse('http://ec2-54-206-191-64.ap-southeast-2.compute.amazonaws.com/api/user'
            '?'
            'mobile=${userInfo.mobile}'
            '&'
            'first_name=${userInfo.firstName}'
            '&'
            'last_name=${userInfo.lastName}'
            '&'
            'device_id=${userInfo.deviceId}'),
        headers: _getPostHeader(),
      );

      if (response.statusCode == 200) {
        return await getUser(userInfo.mobile);
        // return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  Future<List<Category>?> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse('http://ec2-54-206-191-64.ap-southeast-2.compute.amazonaws.com/api/category'),
        headers: _getGetHeader(),
      );

      if (response.statusCode == 200) {
        return _parseToList(
          response.body,
          (Map<String, dynamic> jsonMapObj) => Category.fromJson(
            jsonMapObj,
          ),
        );
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  Future<List<Issue>?> getIssues() async {
    try {
      final response = await http.post(
        Uri.parse('http://ec2-54-206-191-64.ap-southeast-2.compute.amazonaws.com/api/issue'),
        headers: _getPostHeader(),
      );

      if (response.statusCode == 200) {
        return _parseToList(
          response.body,
          (Map<String, dynamic> jsonMapObj) => Issue.fromJson(
            jsonMapObj,
            serializer: _dateTimeSerializer,
          ),
        );
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  Future<IssuesCompanion?> submitIssue(IssuesCompanion issue) async {
    try {
      final response = await http.post(
        Uri.parse('http://ec2-54-206-191-64.ap-southeast-2.compute.amazonaws.com/api/issue?' +
            (issue.internalIssueId.value != null
                ? 'internal_id=${issue.internalIssueId.value}'
                : '') +
            ('&user_id=${issue.userServerId.value}') +
            (issue.address.value != null ? '&address=${issue.address.value}' : '') +
            (issue.lat.value != null ? '&lat=${issue.lat.value}' : '') +
            (issue.long.value != null ? '&lon=${issue.long.value}' : '') +
            (issue.description.value != null ? '&description=${issue.description.value}' : '') +
            (issue.categoryLvl1.value != null ? '&category_1=${issue.categoryLvl1.value}' : '') +
            (issue.categoryLvl2.value != null ? '&category_2=${issue.categoryLvl2.value}' : '') +
            (issue.categoryLvl3.value != null ? '&category_3=${issue.categoryLvl3.value}' : '') +
            (issue.images.value != null ? '&images=${issue.images.value}' : '')),
        headers: _getPostHeader(),
      );
      final decoded = jsonDecode(response.body);
      if (response.statusCode == 200 && decoded != 0) {
        return issue.copyWith(serverIssueId: Value(jsonDecode(response.body)));
      }
    } catch (e) {
      print(e);
      return null;
    }

    return null;
  }

  Future<String?> submitImage(File image) async {
    http.Client _client = http.Client();
    try {
      final urlResponse = await _client.get(
        Uri.parse('https://75kce59dya.execute-api.ap-southeast-2.amazonaws.com/uploads'),
      );

      final Uint8List imgBytes;

      if (!image.path.endsWith('.jpg')) {
        decodeImage(image.readAsBytesSync())!;
        imgBytes = Uint8List.fromList(encodeJpg(decodeImage(image.readAsBytesSync())!));
      } else {
        imgBytes = image.readAsBytesSync();
      }

      if (urlResponse.statusCode == 200) {
        final uploadUrlAndKey = jsonDecode(urlResponse.body);
        final imageUploadedResponse = await _client.put(
          Uri.parse(uploadUrlAndKey['uploadURL']),
          headers: _getImagePostHeader(),
          body: imgBytes,
        );
        if (imageUploadedResponse.statusCode == 200) {
          return uploadUrlAndKey['Key'];
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Map<String, String> _getGetHeader() => {
        "Content-Type": "application/json",
        "Accept": "*/*",
      };

  Map<String, String> _getPostHeader() => {
        "Content-Type": "application/json",
        "Accept": "*/*",
      };

  Map<String, String> _getImagePostHeader() => {
        "Content-Type": "image/jpeg",
        "Accept": "*/*",
      };

  /// Utilises
  List<T> _parseToList<T>(String responseBody, T Function(Map<String, dynamic>) processor) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<T>((jsonMapObj) => processor(jsonMapObj)).toList();
  }

  Set<T> _parseToSet<T>(String responseBody, T Function(Map<String, dynamic>) processor) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<T>((jsonMapObj) => processor(jsonMapObj)).toSet();
  }
}

class DateTimeValueSerializer extends ValueSerializer {
  const DateTimeValueSerializer();

  @override
  T fromJson<T>(dynamic json) {
    if (json == null) {
      return null as T;
    }

    final _typeList = <T>[];

    if (_typeList is List<DateTime> || _typeList is List<DateTime?>) {
      return DateTime.tryParse(json as String) as T;
    }

    if ((_typeList is List<double> || _typeList is List<double?>) && json is int) {
      return json.toDouble() as T;
    }

    if ((_typeList is List<double> || _typeList is List<double?>) && json is String) {
      return double.parse(json) as T;
    }

    return json as T;
  }

  @override
  dynamic toJson<T>(T value) {
    if (value is DateTime) {
      return value.toIso8601String();
    }

    return value;
  }
}
