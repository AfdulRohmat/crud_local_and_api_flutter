import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:produc_crud_app/features/crud_api_feature/models/crud_api_model.dart';
import 'package:produc_crud_app/features/crud_api_feature/repository/crud_api_repository.dart';

class CrudApiViewModel extends GetxController {
  var listProduct = [].obs;
  final CrudApiRepository _crudApiRepository = CrudApiRepository();
  var isLoading = false.obs;

  setListProduct(dynamic data) {
    listProduct.value = data;
  }

  setIsLoading(bool value) {
    isLoading.value = value;
  }

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  Future getAllProducts() async {
    setIsLoading(true);

    _crudApiRepository.fetchProductsApi({}).then((value) {
      setListProduct(value);
      setIsLoading(false);

      //
    }).onError((error, stackTrace) {
      setIsLoading(false);
      debugPrint("error data view model : $error");
    });
  }
}
