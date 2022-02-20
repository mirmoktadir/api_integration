import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  String apiLink2 = 'https://reqres.in/api/users?page=2';
  Map? jsonResponse;
  List? userList;
  static var client = http.Client();
  Future listUser() async {
    var response = await client.get(Uri.parse(apiLink2));
    if (response.statusCode == 200) {
      setState(() {
        jsonResponse = json.decode(response.body);
        userList = jsonResponse!['data'];
      });
    } else {
      return null;
    }
  }

  @override
  void initState() {
    listUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Flutter API Integration'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: userList == null ? 0 : userList!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(userList![index]['avatar']),
                  ),
                  Text(userList![index]['id'].toString()),
                  Text(userList![index]['email'].toString()),
                  Text(userList![index]['first_name'].toString()),
                  Text(userList![index]['last_name'].toString()),
                ],
              ),
            );
          }),
    );
  }
}
