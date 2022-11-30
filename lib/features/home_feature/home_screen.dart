import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () {},
                title: Text(
                  "CRUD with local database",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    color: CrudCustomColors.blackMain,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text(
                  "CRUD with network API",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    color: CrudCustomColors.blackMain,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
