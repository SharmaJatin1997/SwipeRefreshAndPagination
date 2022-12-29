import 'package:dio/dio.dart';
import 'package:pagination/Api_Data/Models/UserModel.dart';
import 'package:pagination/Api_Data/api_provider/api_constants.dart';
import 'package:pagination/Api_Data/shared/page_response.dart';

import '../Injector.dart';

class HomeApiProvider {
  late Dio _dio;

  HomeApiProvider() {
    _dio = Injector().getDio();
  }

  Future<PageResponse<ProductModel?>> getProductList(
      Map<String, dynamic> queries) async {
    try {
      Response response = await _dio.get(ApiConstants.getProductList,
          options: Injector.getHeaderToken(), queryParameters: queries);
      var pageResponse = PageResponse<ProductModel?>.fromJson(response.data,
          (data) => ProductModel.fromJson(data as Map<String, dynamic>));
      return pageResponse;
    } catch (error) {
      final res = (error as dynamic).response;
      if (res != null) return PageResponse.fromJson(res?.data, (data) => null);
      return PageResponse(error_message: error.toString(), status: false);
    }
  }
}
