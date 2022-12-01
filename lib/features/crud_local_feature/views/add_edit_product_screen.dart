import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/features/crud_local_feature/models/product_local_model.dart';
import 'package:produc_crud_app/features/crud_local_feature/view_model/crud_local_view_model.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';
import 'package:produc_crud_app/utils/widgets/custom_appbar.dart';
import 'package:produc_crud_app/utils/widgets/custom_form_field.dart';
import 'package:produc_crud_app/utils/widgets/general_custom_button.dart';

class AddAndEditProductScreen extends StatefulWidget {
  AddAndEditProductScreen({
    super.key,
    required this.isAddProductScreen,
    this.id = 0,
    this.title = '',
    this.price = '',
    this.desc = '',
  });

  final bool isAddProductScreen;

  int id;
  String title;
  String price;
  String desc;

  @override
  State<AddAndEditProductScreen> createState() =>
      _AddAndEditProductScreenState();
}

class _AddAndEditProductScreenState extends State<AddAndEditProductScreen> {
  CrudLocalViewModel crudLocalViewModel = Get.put(CrudLocalViewModel());

  @override
  void initState() {
    if (widget.isAddProductScreen == false) {
      crudLocalViewModel.titleController.text = widget.title;
      crudLocalViewModel.priceController.text = widget.price;
      crudLocalViewModel.descController.text = widget.desc;

      //
    } else {
      crudLocalViewModel.titleController.text = '';
      crudLocalViewModel.priceController.text = '';
      crudLocalViewModel.descController.text = '';
      //
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          title: widget.isAddProductScreen ? "Add Product" : "Edit Product",
          titleColor: CrudCustomColors.darkGreenMain,
          onLeadingTap: () {
            Get.back();
          },
          iconLeading: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              Text(
                "Title",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                  color: CrudCustomColors.blackMain,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              CustomFormField(
                textEditingController: crudLocalViewModel.titleController,
                label: "",
                showLabel: false,
                hintText: "Enter the title of the product",
                keyboardType: TextInputType.text,
                keyParam: AddEditScreenKey.titleKey,
              ),
              const SizedBox(height: 16),

              // PRICE
              Text(
                "Price (Rupiah)",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                  color: CrudCustomColors.blackMain,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              CustomFormField(
                textEditingController: crudLocalViewModel.priceController,
                label: "",
                showLabel: false,
                hintText: "Enter the price of the product",
                keyboardType: TextInputType.number,
                keyParam: AddEditScreenKey.priceKey,
              ),
              const SizedBox(height: 16),

              // DESC
              Text(
                "Description",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                  color: CrudCustomColors.blackMain,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: AddEditScreenKey.descKey,
                child: TextFormField(
                  controller: crudLocalViewModel.descController,
                  keyboardType: TextInputType.multiline,
                  autocorrect: false,
                  style: const TextStyle(fontSize: 12),
                  cursorColor: CrudCustomColors.blackMain,
                  validator: ((value) {
                    if (crudLocalViewModel.descController.text.isEmpty) {
                      if (value != null && value.isEmpty) {
                        return 'Masukan data yang dibutuhkan';
                      } else {
                        return null;
                      }
                    }

                    return null;
                  }),
                  minLines: 1,
                  maxLines: 20,
                  maxLength: 1000,
                  decoration: InputDecoration(
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
                    hintText: "Enter the description of the product",
                    hintStyle: TextStyle(
                      color: CrudCustomColors.darkGreenMain,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GeneralCustomButton(
              title: widget.isAddProductScreen ? "Add Product" : "Edit Product",
              onButtonTap: () {
                final isValidForm =
                    AddEditScreenKey.titleKey.currentState!.validate() &&
                        AddEditScreenKey.priceKey.currentState!.validate() &&
                        AddEditScreenKey.descKey.currentState!.validate();

                if (isValidForm) {
                  widget.isAddProductScreen
                      ? crudLocalViewModel.addProduct(
                          ProductLocalModel(
                            id: null,
                            title: crudLocalViewModel.titleController.text,
                            price: double.tryParse(
                                crudLocalViewModel.priceController.text),
                            description: crudLocalViewModel.descController.text,
                          ),
                        )
                      : crudLocalViewModel.updateProduct(
                          ProductLocalModel(
                            id: widget.id,
                            title: crudLocalViewModel.titleController.text,
                            price: double.tryParse(
                                crudLocalViewModel.priceController.text),
                            description: crudLocalViewModel.descController.text,
                          ),
                        );

                  crudLocalViewModel.titleController.text = '';
                  crudLocalViewModel.priceController.text = '';
                  crudLocalViewModel.descController.text = '';

                  Get.back();
                }
              })),
    );
  }
}

class AddEditScreenKey {
  static final titleKey = GlobalKey<FormState>();
  static final priceKey = GlobalKey<FormState>();
  static final descKey = GlobalKey<FormState>();
}
