import 'package:get/get.dart';

extension StringOperation on String {
   toShowSnackBar(){
    return Get.showSnackbar(
      GetSnackBar(
        message: this,
        duration: Duration(seconds: 3),
      ),
    );
  }
}