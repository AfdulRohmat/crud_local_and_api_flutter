import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';

class GeneralCustomButton extends StatefulWidget {
  GeneralCustomButton({
    Key? key,
    required this.title,
    required this.onButtonTap,
    this.onlyBorder = false,
    this.isEnable = true,
  }) : super(key: key);
  final String title;
  final Function onButtonTap;
  final bool onlyBorder;
  bool isEnable;

  @override
  State<GeneralCustomButton> createState() => _GeneralCustomButtonState();
}

class _GeneralCustomButtonState extends State<GeneralCustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.isEnable ? widget.onButtonTap() : null;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.isEnable
            ? widget.onlyBorder
                ? Colors.white
                : CrudCustomColors.darkGreenMain
            : Colors.grey,
        fixedSize: Size(Get.width, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: widget.onlyBorder
                ? CrudCustomColors.darkGreenMain
                : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          widget.title,
          style: GoogleFonts.manrope(
            color: widget.onlyBorder
                ? CrudCustomColors.darkGreenMain
                : CrudCustomColors.whiteMain,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
