import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:produc_crud_app/features/employe_feature/models/employee_model.dart';

class EmployeRepository {
 static Future<List<EmployeModel>> getEmployeDataLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle
        .loadString("lib/data/localJSON/employee_payroll.json");
    final body = json.decode(data);

    return body.map<EmployeModel>(EmployeModel.fromJson).toList();
  }
}
