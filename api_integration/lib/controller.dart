import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'model/model.dart';

class Controller extends GetxController {
  var isLoading = false.obs;
  @override
  void oninit() {
    super.onInit();
    fetchProductList();
  }

  List<ProductModel> productList = [];
  Future<void> fetchProductList() async {
    final Dio client = Dio();
    var response = await client.get(
      'https://fakestoreapi.com/products',
    );
    List<ProductModel> products =
        (response.data as List).map((e) => ProductModel.fromJson(e)).toList();

    productList = products;
  }
}
