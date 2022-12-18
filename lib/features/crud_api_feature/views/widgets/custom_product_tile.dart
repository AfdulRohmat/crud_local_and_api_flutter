import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';

class CustomProductTile extends StatelessWidget {
  CustomProductTile({
    required this.title,
    required this.price,
    required this.category,
    required this.desc,
    required this.rate,
    required this.cart,
    required this.imgUrl,
    required this.onTileTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final String price;
  final String category;
  final String desc;
  final String rate;
  final String cart;
  final String imgUrl;
final  Function onTileTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTileTap(),
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(8),
          width: Get.width,
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imgUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                width: 190,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TITLE
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        color: CrudCustomColors.blackMain,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    //  PRICE
                    Text(
                      "\$ $price",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        color: CrudCustomColors.blackMain,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // CATEGORY
                    Text(
                      "category : $category ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        color: CrudCustomColors.blackMain,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // DESC
                    Text(
                      desc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        color: CrudCustomColors.blackMain,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // RATING
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              rate,
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
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              cart,
                              style: GoogleFonts.manrope(
                                color: CrudCustomColors.blackMain,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
