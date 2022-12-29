import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class Utils {
  static errorSnackBar(String? message) {
    if (message == null) {
      return;
    }
    Get.closeAllSnackbars();
    Get.snackbar(
      "Pagination",
      message,
      duration: const Duration(seconds: 2),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      backgroundColor: Colors.blue,
      borderRadius: 5,
      snackPosition: SnackPosition.TOP,
      titleText: const Text(
        "Pagination",
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            height: 1),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            height: 1.6),
      ),
    );
  }

  static showLoader() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
      indicator: const CircularProgressIndicator(color:Colors.blue),
      status: "loading...",
    );
  }

  static Future hideLoader() async {
    return await EasyLoading.dismiss();
  }

  static showError(String? error) {
    CoolAlert.show(
      context: Get.context!,
      // MyApp.navigatorKey.currentContext!,
      type: CoolAlertType.error,
      title: 'Oops...',
      text: "Something Went Wrong..",
      confirmBtnColor: Colors.blue,
      loopAnimation: false,
      backgroundColor: Colors.blue,
    );
  }

  static showSuccessAlert(String message) {
    CoolAlert.show(
      context: Get.context!,
      type: CoolAlertType.success,
      text: message,
    );
  }

  static showWarningAlert(String message) {
    CoolAlert.show(
      context: Get.context!,
      type: CoolAlertType.warning,
      text: message,
    );
  }

  static hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<bool> hasNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      ("Strings.check_your_internet_connectivity");
      return false;
    } else {
      return true;
    }
  }


}
