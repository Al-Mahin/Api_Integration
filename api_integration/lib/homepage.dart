import 'package:api_integration/model/model.dart';
import 'package:api_integration/model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  initState() {
    super.initState();
    fetchProductList();
  }

  List<ProductModel> productList = [];
  Future<void> fetchProductList() async {
    final Dio client = Dio();
    Response response = await client.get(
      'https://fakestoreapi.com/products',
    );
    List<ProductModel> products = (response.data as List).map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    print(products);
    setState(
      () {
        productList = products;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: productList.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                shrinkWrap: false,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text('${productList[index].id}'),
                            title: Text('${productList[index].title}'),
                            subtitle: Text('${productList[index].description}'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
