import 'dart:convert';
import 'package:api_integration/view/pages/dynamic_page/dynamic_user_page.dart';
import 'package:api_integration/view/pages/static_page/single_user_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../dynamic_page/dynamic_single_user_page.dart';
import 'list_user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Data from net'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Api Integration',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 100,
              ),
              // Single User

              TextButton(
                onPressed: () {
                  Get.to(const SingleUserPage());
                },
                child: const Text('Single User (Hard code)'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Get.to(const ListUserPage());
                },
                child: const Text('List of User (Hard code)'),
              ),

              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Get.to(DynamicSingleUserPage());
                },
                child: const Text('Single User (GetX MVC)'),
              ),
              const SizedBox(
                height: 20,
              ),

              TextButton(
                onPressed: () {
                  Get.to(DynamicUsersPage());
                },
                child: const Text('List of User (GetX MVC)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
