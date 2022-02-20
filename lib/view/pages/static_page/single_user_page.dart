import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingleUserPage extends StatefulWidget {
  const SingleUserPage({Key? key}) : super(key: key);

  @override
  _SingleUserPageState createState() => _SingleUserPageState();
}

class _SingleUserPageState extends State<SingleUserPage> {
  String apiLink1 = 'https://reqres.in/api/users/2';

  Map? singleUserResponse;
  Map? singleUserData;

  Future singleUser() async {
    http.Response response;
    response = await http.get(Uri.parse(apiLink1));
    if (response.statusCode == 200) {
      setState(() {
        singleUserResponse = json.decode(response.body); //main or parent map
        singleUserData = singleUserResponse!['data']; //child map
      });
    } else {
      return null;
    }
  }

  @override
  void initState() {
    singleUser();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // Single User
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue,
              ),
              child: Center(
                child: singleUserData == null
                    ? SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'Data is Loading..',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        singleUserData!['avatar'].toString()),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              singleUserData!['first_name'].toString() +
                                  ' ' +
                                  singleUserData!['last_name'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              singleUserData!['email'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
