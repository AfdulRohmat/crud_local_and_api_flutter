import 'package:produc_crud_app/data/database/db_helper.dart';
import 'package:produc_crud_app/features/crud_local_feature/models/product_local_model.dart';

class CrudLocalRepository {
  DBHelper dbHelper = DBHelper();
  String tableName = "product";

  // GET ALL PRODUCT DATA
  Future<List<ProductLocalModel>> getProducts() async {
    var dbClient = await dbHelper.db;

    List<Map> maps = await dbClient
        .query(tableName, columns: ['id', 'title', 'price', 'description']);

    List<ProductLocalModel> productLocal = [];

    for (int i = 0; i < maps.length; i++) {
      productLocal.add(ProductLocalModel.fromMap(maps[i]));
    }
    return productLocal;
  }

  // ADD PRODUCT TO DB
  Future<int> addProductToDB(ProductLocalModel productLocalModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, productLocalModel.toMap());
  }

  // UPDATE PRODUCT TO DB
  Future<int> updateProduct(ProductLocalModel productLocalModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableName, productLocalModel.toMap(),
        where: 'id = ?', whereArgs: [productLocalModel.id]);
  }

  // DELETE PRODUCT FROM DB
  Future<int> deleteProduct(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
