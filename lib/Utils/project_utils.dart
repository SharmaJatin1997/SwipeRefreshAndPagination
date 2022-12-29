import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UtilsLiveDj{
  static errorSnackBar(String? message) {
    if (message == null) {
      return;
    }
    Get.closeAllSnackbars();
    Get.snackbar(
      "Pagination",
      message,
      backgroundColor: Colors.blue,
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      borderRadius: 5,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      titleText: const Text(
        "Pagination",
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            height: 1.6),
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


  static Future<bool> hasNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      //Utils.showError("check your connection");
      return false;
    } else {
      return true;
    }
  }



}
