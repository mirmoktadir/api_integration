import 'package:api_integration/controller/single_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicSingleUserPage extends StatelessWidget {
  DynamicSingleUserPage({Key? key}) : super(key: key);
  final SingleUserController singleUserController =
      Get.put(SingleUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Flutter API Integration'),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<SingleUserController>(
          init: SingleUserController(),
          builder: (user) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
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
                      child: user == null
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
                                  user.avatar.isEmpty
                                      ? const SizedBox(
                                          width: 200,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    user.avatar.toString()),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    user.first_name.toString() +
                                        ' ' +
                                        user.last_name.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    user.email.toString(),
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
            );
          }),
    );
  }
}
