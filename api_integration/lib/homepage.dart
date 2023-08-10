import 'package:api_integration/controller.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  Controller myController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => myController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: false,
                itemCount: myController.productList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text(
                                '${myController.productList[index].title ?? 0}'),
                            title: Text(
                                '${myController.productList[index].title}'),
                            subtitle: Text(
                                '${myController.productList[index].description}'),
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
