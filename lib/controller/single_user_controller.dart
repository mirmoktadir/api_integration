import 'package:api_integration/services/single_user_services.dart';
import 'package:get/get.dart';

class SingleUserController extends GetxController {
  var isLoading = false.obs;
  String email = '';
  String first_name = '';
  String last_name = '';
  String avatar = '';
  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  getUser() async {
    try {
      var user = await SingleUserServices.singleUser();
      if (user != null) {
        email = user.data!.email!;
        first_name = user.data!.firstName!;
        last_name = user.data!.lastName!;
        avatar = user.data!.avatar!;
        update();
      }
      update();
    } finally {
      isLoading(true);
      update();
    }
  }
}
