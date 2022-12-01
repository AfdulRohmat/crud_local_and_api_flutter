import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';

class CustomProductLocalTile extends StatelessWidget {
  const CustomProductLocalTile({
    required this.title,
    required this.price,
    required this.desc,
    required this.onTileTap,
    Key? key,
    required this.onDelete,
  }) : super(key: key);

  final String title;
  final String price;
  final String desc;
  final Function onTileTap;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTileTap(),
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                // PRICE
                Text(
                  "Rp $price",
                  style: GoogleFonts.manrope(
                    color: CrudCustomColors.blackMain,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),

                // DESCRIPTION
                Text(
                  desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(
                    color: CrudCustomColors.blackMain,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () => onDelete(),
                    icon: const Icon(Icons.delete, size: 20)),
                const Icon(Icons.arrow_forward_ios_outlined, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
