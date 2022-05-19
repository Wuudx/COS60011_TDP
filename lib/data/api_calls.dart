import 'dart:convert';
import 'dart:io';
import 'package:council_reporting/data/user_registration_info.dart';
import 'package:http/http.dart' as http;

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
        Uri.parse('https://api.com/users?mobile=$mobile'),
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

  Future<void> requestOtp(String mobile, String? deviceId) async {
    try {
      await http.post(
        Uri.parse('https://api.com/triger_otp'),
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
        Uri.parse('https://api.com/otp?mobile=$mobile&otp=$otp'),
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
        Uri.parse('https://api.com/users?mobile=$mobile'),
        headers: _getGetHeader(),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
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
      final response = await http
          .post(Uri.parse('https://api.com/register_user'), headers: _getPostHeader(), body: {
        'mobile': userInfo.mobile,
        'firstName': userInfo.firstName,
        'lastName': userInfo.lastName,
        'deviceId': userInfo.deviceId,
      });

      if (response.statusCode == 201) {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  Future<List<Category>?> getCategories() async {
    final response = await http.post(
      Uri.parse('https://api.com'),
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

    return null;
  }

  Future<IssuesCompanion?> submitIssue(IssuesCompanion issue) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.com'),
        headers: _getPostHeader(),
        body: jsonEncode({
          'User_ID': issue.userServerId,
          'address': issue.address,
          'lat': issue.lat,
          'long': issue.long,
          'status': issue.status,
          'vote': issue.vote,
          'description': issue.description,
          'categoryLvl1': issue.categoryLvl1,
          'categoryLvl2': issue.categoryLvl2,
          'categoryLvl3': issue.categoryLvl3,
          'images': issue.images,
          'notes': issue.notes,
        }),
      );

      if (response.statusCode == 201) {
        return issue.copyWith(serverIssueId: jsonDecode(response.body)['Server_Issue_ID']);
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

      final imgBytes = image.readAsBytesSync();
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
