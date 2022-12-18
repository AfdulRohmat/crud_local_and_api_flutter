import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/features/crud_api_feature/view_model/crud_api_view_model.dart';
import 'package:produc_crud_app/features/crud_api_feature/views/detail_product_screen.dart';
import 'package:produc_crud_app/features/crud_api_feature/views/widgets/custom_product_tile.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';
import 'package:produc_crud_app/utils/widgets/custom_appbar.dart';

class CrudApiScreen extends StatelessWidget {
  CrudApiScreen({super.key});

  final CrudApiViewModel crudApiViewModel = Get.put(CrudApiViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          title: "DATA FROM API",
          titleColor: CrudCustomColors.darkGreenMain,
          onLeadingTap: () {
            Get.back();
          },
          iconLeading: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Obx(() {
              if (crudApiViewModel.isLoading.value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 300),
                    Center(
                      child: CircularProgressIndicator(
                        color: CrudCustomColors.darkGreenMain,
                      ),
                    ),
                  ],
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var dataPerItem = crudApiViewModel.listProduct[index];
                      return CustomProductTile(
                        title: dataPerItem.title,
                        price: dataPerItem.price.toString(),
                        category: dataPerItem.category,
                        desc: dataPerItem.description,
                        rate: dataPerItem.rating.rate.toString(),
                        cart: dataPerItem.rating.count.toString(),
                        imgUrl: dataPerItem.image,
                        onTileTap: () {},
                      );
                    },
                    itemCount: crudApiViewModel.listProduct.length,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
