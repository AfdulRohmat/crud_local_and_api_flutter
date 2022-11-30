import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:produc_crud_app/common/app_url.dart';
import 'package:produc_crud_app/data/network/base_api_service.dart';
import 'package:produc_crud_app/data/network/network_api_service.dart';
import 'package:produc_crud_app/features/crud_api_feature/models/crud_api_model.dart';

class CrudApiRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  static var client = http.Client();

  Future<dynamic> fetchProductsApi(Map<String, String>? headers) async {
    try {
      dynamic response = await _apiServices.getApiResoponse(
          "${AppUrl.baseFakeStoreApi}products", headers);

      return response.map((item) => ProductsApiModel.fromJson(item)).toList();
    } catch (e) {
      debugPrint("error data repo : $e");
      rethrow;
    }
  }
}
