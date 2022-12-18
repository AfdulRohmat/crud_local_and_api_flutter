import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/features/crud_api_feature/view_model/crud_api_view_model.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';
import 'package:produc_crud_app/utils/widgets/custom_appbar.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key, required this.idProduct});

  final int idProduct;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  final CrudApiViewModel crudApiViewModel = Get.put(CrudApiViewModel());

  @override
  void initState() {
    crudApiViewModel.getDetailProduct(widget.idProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          title: "Detail Product",
          titleColor: CrudCustomColors.darkGreenMain,
          onLeadingTap: () {
            Get.back();
          },
          iconLeading: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: SingleChildScrollView(child: Obx(() {
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(height: 8),

                //
                Text(
                  "  crudApiViewModel.detailProduct.title",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(
                    color: CrudCustomColors.blackMain,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                //
                Text(
                  "   crudApiViewModel.detailProduct.price.toString()",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(
                    color: CrudCustomColors.blackMain,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                //
                Text(
                  "crudApiViewModel.detailProduct.category",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(
                    color: CrudCustomColors.blackMain,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                //
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 24,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "crudApiViewModel.detailProduct.rating.rate.toString()",
                          style: GoogleFonts.manrope(
                            color: CrudCustomColors.blackMain,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: CrudCustomColors.blackMain,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "crudApiViewModel.detailProduct.rating.count"
                              .toString(),
                          style: GoogleFonts.manrope(
                            color: CrudCustomColors.blackMain,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                //
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "crudApiViewModel.detailProduct.description",
                    style: GoogleFonts.manrope(
                      color: CrudCustomColors.blackMain,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            );
          }
        })),
      ),
    );
  }
}
