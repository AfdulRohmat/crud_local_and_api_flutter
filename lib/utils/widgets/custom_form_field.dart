import 'package:flutter/material.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';

// ignore: must_be_immutable
class CustomFormField extends StatefulWidget {
  CustomFormField({
    Key? key,
    required this.textEditingController,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    this.showLabel = true,
    required this.keyParam,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  bool showLabel;
  GlobalKey? keyParam;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: widget.keyParam,
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        autocorrect: false,
        style: const TextStyle(fontSize: 12),
        cursorColor: CrudCustomColors.blackMain,
        validator: ((value) {
          if (widget.textEditingController.text.isEmpty) {
            if (value != null && value.isEmpty) {
              return 'Masukan data yang dibutuhkan';
            } else {
              return null;
            }
          }

          return null;
        }),
        decoration: InputDecoration(
          labelText: widget.showLabel ? widget.label : null,
          labelStyle: TextStyle(
            color: CrudCustomColors.blackMain,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              width: 1,
              color: CrudCustomColors.darkGreenMain,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              width: 1,
              color: CrudCustomColors.darkGreenMain,
              style: BorderStyle.solid,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: CrudCustomColors.darkGreenMain,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
