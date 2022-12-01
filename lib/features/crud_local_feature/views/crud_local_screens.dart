import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/features/crud_local_feature/view_model/crud_local_view_model.dart';
import 'package:produc_crud_app/features/crud_local_feature/views/add_edit_product_screen.dart';
import 'package:produc_crud_app/features/crud_local_feature/views/widgets/custom_product_local_tile.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';
import 'package:produc_crud_app/utils/widgets/custom_appbar.dart';

class CrudLocalScreen extends StatelessWidget {
  CrudLocalScreen({super.key});

  final CrudLocalViewModel crudLocalViewModel = Get.put(CrudLocalViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          title: "CRUD Local Database",
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
            Obx(
              () {
                if (crudLocalViewModel.isLoading.value) {
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
                  if (crudLocalViewModel.productList.isEmpty) {
                    return Column(
                      children: [
                        const SizedBox(height: 300),
                        Center(
                          child: Text(
                            "Empty Data",
                            style: GoogleFonts.manrope(
                              color: CrudCustomColors.blackMain,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          var itemPerIndex =
                              crudLocalViewModel.productList[index];
                          return CustomProductLocalTile(
                            title: itemPerIndex.title!,
                            price: itemPerIndex.price.toString(),
                            desc: itemPerIndex.description!,
                            onTileTap: () {
                              Get.to(
                                () => AddAndEditProductScreen(
                                  isAddProductScreen: false,
                                  id: itemPerIndex.id!,
                                  title: itemPerIndex.title!,
                                  price: itemPerIndex.price.toString(),
                                  desc: itemPerIndex.description!,
                                ),
                              );
                            },
                            onDelete: () {
                              crudLocalViewModel
                                  .deleteProduct(itemPerIndex.id!);
                            },
                          );
                        },
                        itemCount: crudLocalViewModel.productList.length,
                      ),
                    );
                  }
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddAndEditProductScreen(isAddProductScreen: true));
        },
        backgroundColor: CrudCustomColors.darkGreenMain,
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
