import 'package:api_integration/controller/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicUsersPage extends StatelessWidget {
  DynamicUsersPage({Key? key}) : super(key: key);
  final UserListController userListController = Get.put(UserListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Data from net'),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<UserListController>(
          init: UserListController(),
          builder: (users) {
            return ListView.builder(
                itemCount: users.userList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              users.userList[index].avatar.toString()),
                        ),
                        Text(users.userList[index].id.toString()),
                        Text(users.userList[index].email.toString()),
                        Text(users.userList[index].firstName.toString()),
                        Text(users.userList[index].lastName.toString()),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
