import 'dart:convert';

import 'package:api_integration/model/SingleUserModel.dart';
import 'package:http/http.dart' as http;

class SingleUserServices {
  static var client = http.Client();
  static Future<SingleUserModel?> singleUser() async {
    var response = await client.get(Uri.parse('https://reqres.in/api/users/2'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var user = SingleUserModel.fromJson(jsonResponse);
      return user;
    } else {
      return null;
    }
  }
}
