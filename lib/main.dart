import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/pages/home_page.dart';

void main() {
  runApp(const APIIntegration());
}

class APIIntegration extends StatelessWidget {
  const APIIntegration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
