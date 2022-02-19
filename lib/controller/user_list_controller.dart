import 'package:api_integration/model/user_list_model.dart';
import 'package:api_integration/services/user_list_services.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  var isLoading = false.obs;
  var userList = <Users>[].obs;
  @override
  void onInit() {
    getUserList();
    super.onInit();
  }

  getUserList() async {
    try {
      var users = await UserListServices.userList();
      if (users != null) {
        userList.value = users.data!;
      }
      update();
    } finally {
      isLoading(false);
      update();
    }
  }
}
