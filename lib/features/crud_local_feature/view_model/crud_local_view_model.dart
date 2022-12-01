import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:produc_crud_app/features/crud_local_feature/models/product_local_model.dart';
import 'package:produc_crud_app/features/crud_local_feature/repository/crud_local_repository.dart';

class CrudLocalViewModel extends GetxController {
  var productList = <ProductLocalModel>[].obs;
  CrudLocalRepository crudLocalRepository = CrudLocalRepository();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var isLoading = false.obs;

  setIsLoading(bool value) {
    isLoading.value = value;
  }

  @override
  void onInit() {
    fetchAllProduct();
    super.onInit();
  }

  // FETCH ALL DATA PRODUCT
  fetchAllProduct() async {
    setIsLoading(true);
    var student = await crudLocalRepository.getProducts();
    productList.value = student;
    setIsLoading(false);
  }

  // ADD PRODUCT TO DB
  addProduct(ProductLocalModel productLocalModel) {
    setIsLoading(true);
    crudLocalRepository.addProductToDB(productLocalModel);
    fetchAllProduct();
    setIsLoading(false);
  }

  // UPDATE PRODUCT
  updateProduct(ProductLocalModel productLocalModel) {
    setIsLoading(true);
    crudLocalRepository.updateProduct(productLocalModel);
    fetchAllProduct();
    setIsLoading(false);
  }

  // DELETE PRODUCT
  deleteProduct(int id) {
    setIsLoading(true);
    crudLocalRepository.deleteProduct(id);
    fetchAllProduct();
    setIsLoading(false);
  }
}
