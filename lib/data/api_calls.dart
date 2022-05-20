import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:council_reporting/data/user_registration_info.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart';

import 'db.dart';

final user = User(
  id: 1,
  deviceId: 'abc123def456ghi789k0',
  firstName: 'Test',
  lastName: 'User',
  mobile: '0499999999',
  points: 0,
);

const fakeValidOtp = true;
const fakeUser = true;

class Api {
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
        return User.fromJson(jsonDecode(response.body)[0]);
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  Future<User?> submitUserInfo(UserRegistrationInfo userInfo) async {
    if (fakeUser) {
      return user;
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
        return User.fromJson(jsonDecode(response.body));
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
        Uri.parse('http://ec2-54-206-191-64.ap-southeast-2.compute.amazonaws.com/api/issue'
            '?'
            'internal_id=${issue.internalIssueId}'
            '&'
            'user_id=${issue.userServerId}'
            '&'
            'address=${issue.address}'
            '&'
            'lat=${issue.lat}'
            '&'
            'lon=${issue.long}'
            '&'
            'vote=${issue.vote}'
            '&'
            'description=${issue.description}'
            '&'
            'category_1=${issue.categoryLvl1}'
            '&'
            'category_2=${issue.categoryLvl2}'
            '&'
            'category_3=${issue.categoryLvl3}'
            // '&'
            // 'images=${issue.images}'
            '&'
            'notes=${issue.notes}'),
        headers: _getPostHeader(),
      );

      if (response.statusCode == 200) {
        return issue.copyWith(serverIssueId: jsonDecode(response.body));
      }
    } catch (e) {
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
