import 'dart:convert';

import 'package:api_integration/model/user_list_model.dart';
import 'package:http/http.dart' as http;

class UserListServices {
  static var client = http.Client();
  static Future<UserListModel?> userList() async {
    var response =
        await client.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var userList = UserListModel.fromJson(jsonResponse);

      return userList;
    } else {
      return null;
    }
  }
}
