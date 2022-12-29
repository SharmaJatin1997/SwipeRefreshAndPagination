import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination/Api_Data/Api_Controller%20/controller.dart';
import 'package:pagination/Api_Data/api_provider/api_constants.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key) {
    controller.getProductList();
  }

  final controller = Get.put(ApiController());

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("Swipe Refresh & Pagination",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18))),
      body: Obx(
        () => SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: const MaterialClassicHeader(
              color: Colors.deepOrange,
            ),
            footer: const ClassicFooter(
              textStyle: TextStyle(color: Colors.black),
              loadingIcon: CupertinoActivityIndicator(
                color: Colors.deepOrange,
              ),
              loadStyle: LoadStyle.ShowWhenLoading,
            ),
            controller: _refreshController,
            scrollDirection: Axis.vertical,
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  var modelImage = controller.productList[index]!.productImage;
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      modelImage != null
                          ? Center(
                              child: CachedNetworkImage(
                                imageUrl: modelImage[0].image != null
                                    ? "${ApiConstants.productImageUrl}/${modelImage[0].image!}"
                                    : "",
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.deepOrange),
                                ),
                                errorWidget: (context, url, error) => Image.network(
                                    "https://img.freepik.com/premium-vector/no-data-concept-illustration_203587-28.jpg?w=2000"),
                              ),
                            )
                          : Container(),
                      Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.7)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              controller.productList[index]!.productName ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ))
                    ],
                  );
                })),
      ),
    );
  }

  void _onRefresh() {
    Future.delayed(const Duration(milliseconds: 1000)).then((val) async {
      controller.productPageOffset.value = 0;
      await controller.getProductList();
      _refreshController.refreshCompleted();
    });
  }

  void _onLoading() {
    Future.delayed(const Duration(milliseconds: 1000)).then((val) async {
      ++controller.productPageOffset.value;
      await controller.getProductPagination();
      _refreshController.loadComplete();
    });
  }
}
