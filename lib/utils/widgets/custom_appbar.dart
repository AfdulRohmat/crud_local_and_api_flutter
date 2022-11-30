import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {Key? key,
      required this.title,
      required this.iconLeading,
      required this.onLeadingTap,
      this.titleColor = Colors.white,
      this.showLeading = true})
      : super(key: key);

  final String title;
  final Widget iconLeading;
  final Function onLeadingTap;
  bool showLeading;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: CrudCustomColors.blackMain, //change your color here
      ),
      title: Text(
        title,
        overflow: TextOverflow.clip,
        style: GoogleFonts.manrope(
          color: titleColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: showLeading
          ? IconButton(
              icon: iconLeading,
              onPressed: () {
                showLeading ? onLeadingTap() : null;
              },
            )
          : Container(),
    );
  }
}
