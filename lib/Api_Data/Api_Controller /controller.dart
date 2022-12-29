import 'dart:collection';
import 'package:get/get.dart';
import 'package:pagination/Api_Data/Models/UserModel.dart';
import 'package:pagination/Api_Data/api_provider/home_api_provider.dart';
import 'package:pagination/Api_Data/shared/page_response.dart';
import 'package:pagination/Utils/utils.dart';

class ApiController extends GetxController {
  var productPageLimit = 10;
  var productPageOffset = 0.obs;
  RxList<ProductModel?> productList = RxList();
  late HomeApiProvider _homeApiProvider;

  @override
  void onInit() {
    _homeApiProvider = HomeApiProvider();
    super.onInit();
  }

  Future getProductList() async {
    if (await Utils.hasNetwork()) {
      Map<String, dynamic> queries = HashMap();
      queries["limit"] = productPageLimit;
      queries["offset"] = productPageOffset;
      PageResponse<ProductModel?> response =
          await _homeApiProvider.getProductList(queries);
      if (response.status == false) {
        Utils.showError(response.error_message);
      } else {
        productList.clear();
        if (response.body != null) {
          productList.value = response.body ?? [];
        } else {
          Utils.showError("Something went wrong");
        }
      }
      productList.refresh();
    }
  }

  Future getProductPagination() async {
    if (await Utils.hasNetwork()) {
      Map<String, dynamic> queries = HashMap();
      queries["limit"] = productPageLimit;
      queries["offset"] = productPageOffset * productPageLimit;
      PageResponse<ProductModel?> response =
          await _homeApiProvider.getProductList(queries);
      if (response.status == false) {
        Utils.showError(response.error_message);
      } else {
        if (response.body != null) {
          if (response.body!.isNotEmpty) {
            productList.value.addAll(response.body ?? []);
          }
        }
        productList.refresh();
      }
    }
  }
}
