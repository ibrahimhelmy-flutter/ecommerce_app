import 'dart:async';

import 'package:ecommerce_app/constanse.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDatebasehelper {
  CartDatebasehelper._();
  static final CartDatebasehelper db = CartDatebasehelper._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "CartProduct.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCartProduct(
        $columnName TEXT NOT NULL,
        $columnimage TEXT NOT NULL,
        $columnquntety INTEGER NOT NULL,
        $columnPric TEXT NOT NULL,
        $columnproductId TEXT NOT NULL
        
        )
         ''');
    });
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.insert(tableCartProduct, model.tojson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Future<int> updateQuentity(CartProductModel product, String addOrsub) async {
  //   var dbClient = await database;
  //   return await dbClient.rawUpdate(
  //       'UPDATE $tableCartProduct SET $columnquntety = "${addOrsub == 'add' ? product.quentity + 1 : product.quentity - 1}" WHERE $columnproductId="${product.productId}"');

  // }

//onther way to method update

  Future<int> updateQuentity(CartProductModel product) async {
    var dbClient = await database;
    return await dbClient.update(tableCartProduct, product.tojson(),
        where: '$columnproductId = ?', whereArgs: [product.productId]);
  }
}
