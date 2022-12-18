import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:produc_crud_app/features/employe_feature/models/employee_model.dart';
import 'package:produc_crud_app/features/employe_feature/repository/salary_repository.dart';
import 'package:produc_crud_app/res/colors/crud_custom_colors.dart';
import 'package:produc_crud_app/utils/widgets/currency_format.dart';
import 'package:produc_crud_app/utils/widgets/custom_appbar.dart';

class EmployeScreen extends StatefulWidget {
  const EmployeScreen({super.key});

  @override
  State<EmployeScreen> createState() => _EmployeScreenState();
}

class _EmployeScreenState extends State<EmployeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            title: "Employe List",
            titleColor: CrudCustomColors.darkGreenMain,
            onLeadingTap: () {
              Get.back();
            },
            iconLeading: const Icon(Icons.arrow_back),
          ),
        ),
        body: FutureBuilder<List<EmployeModel>>(
          future: EmployeRepository.getEmployeDataLocally(context),
          builder: (context, snapshot) {
            final employes = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    color: CrudCustomColors.darkGreenMain,
                  ),
                );

              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "some error occured",
                      style: GoogleFonts.manrope(
                        color: CrudCustomColors.blackMain,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  );
                } else {
                  return buildEmploye(employes);
                }
            }
          },
        ));
  }

  Widget buildEmploye(List<EmployeModel>? employes) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: employes!.length,
        itemBuilder: (context, index) {
          final employe = employes[index];
          var ptkp = employe.status.ptkp;

          var penghasilanNettoPerMonth = employe.country == "Indonesia"
              ? ((employe.baseSalary * 12) - ptkp) / 12
              : ((employe.baseSalary * 12) - (employe.insurance * 12) - ptkp) /
                  12;

          var penghasilanNettoPerYear = employe.country == "Indonesia"
              ? ((employe.baseSalary * 12) - ptkp)
              : ((employe.baseSalary * 12) - (employe.insurance * 12) - ptkp);

          var incomeTaxPerMonth = employe.annualTaxTotal / 12;

          return Card(
            child: ListTile(
              onTap: (() {
                showDetailInfo(employe, penghasilanNettoPerMonth,
                    penghasilanNettoPerYear, incomeTaxPerMonth);
              }),
              title: Text(
                employe.name,
                style: GoogleFonts.manrope(
                  color: CrudCustomColors.blackMain,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Text(
                employe.country,
                style: GoogleFonts.manrope(
                  color: CrudCustomColors.blackMain,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void showDetailInfo(EmployeModel employe, penghasilanNettoPerMonth,
    penghasilanNettoPerYear, incomeTaxPerMonth) {
  Get.defaultDialog(
    radius: 8,
    title: "Employee Information",
    titlePadding: const EdgeInsets.all(16),
    content: Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NAME
          Text(
            "Name",
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            employe.name,
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 16),

          // STATUS PERNIKAHAN
          Text(
            "Marital Status",
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${employe.status.maritalStatus == "TK" ? "Single" : employe.status.maritalStatus == "K0" ? "Married No Kid" : employe.status.maritalStatus == "K1" ? "Married 1 kid" : employe.status.maritalStatus == "K" ? "Married" : ""} [${employe.status.maritalStatus}]",
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 16),

          employe.insurance != null
              ? // STATUS PERNIKAHAN
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Insurance",
                      style: GoogleFonts.manrope(
                        color: CrudCustomColors.blackMain,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(
                          employe.insurance, 2, employe.country),
                      style: GoogleFonts.manrope(
                        color: CrudCustomColors.blackMain,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 16)
                  ],
                )
              : Container(),

          // BRUTO PER MONTH
          Text(
            "Gross income per month",
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            CurrencyFormat.convertToIdr(employe.baseSalary, 2, employe.country),
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),

          const SizedBox(height: 16),

          // NETTO PER MONTH
          Text(
            "Net income per month",
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            CurrencyFormat.convertToIdr(
                penghasilanNettoPerMonth, 2, employe.country),
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 16),

          // NETTO PER YEAR
          Text(
            "Net income per year",
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            CurrencyFormat.convertToIdr(
                penghasilanNettoPerYear, 2, employe.country),
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 16),

          // INCOM TAX PER MONTH
          Text(
            "Income tax per month",
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            CurrencyFormat.convertToIdr(incomeTaxPerMonth, 2, employe.country),
            style: GoogleFonts.manrope(
              color: CrudCustomColors.blackMain,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );
}
