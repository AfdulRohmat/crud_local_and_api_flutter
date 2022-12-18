import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/features/crud_api_feature/views/crud_api_screen.dart';
import 'package:produc_crud_app/features/crud_local_feature/views/crud_local_screens.dart';
import 'package:produc_crud_app/features/employe_feature/view/employe_screen.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';
import 'package:produc_crud_app/utils/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Home",
          titleColor: CrudCustomColors.darkGreenMain,
          showLeading: false,
          onLeadingTap: () {},
          iconLeading: const Icon(
            Icons.arrow_back,
            color: Colors.transparent,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () => Get.to(() => CrudLocalScreen()),
                title: Text(
                  "CRUD with local database",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    color: CrudCustomColors.blackMain,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () => Get.to(() => CrudApiScreen()),
                title: Text(
                  "Load Data From API",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    color: CrudCustomColors.blackMain,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () => Get.to(() => const EmployeScreen()),
                title: Text(
                  "Local JSON Employee Payroll",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    color: CrudCustomColors.blackMain,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
