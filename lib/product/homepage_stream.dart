import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shopnew/Api/product_api.dart';
import 'package:shopnew/contract/contract.dart';
import 'package:shopnew/product/product.dart';
import 'package:shopnew/product/product_category.dart';

class HomeProductBlock implements Dispose {
  int categoryID;
  List<Product> products;
  ProductApi productApi;
  final StreamController<List<Product>> _productController =
      StreamController<List<Product>>.broadcast();
  final StreamController<int> _categoryController =
      StreamController<int>.broadcast();

  StreamSink<int> get fetchProduct => _categoryController.sink;

  Stream<int> get category => _categoryController.stream;

  Stream<List<Product>> get productStream => _productController.stream;

  HomeProductBlock() {
    products = [];
productApi=ProductApi();
    _productController.add(products);
    _categoryController.add(categoryID);
    _categoryController.stream.listen(_feachCategoryfromApi);
  }

  Future<void> _feachCategoryfromApi(int category)async  {
    this.products = await productApi.fetchProductByCategory(category, 1);
    _productController.add(this.products);


  }

  @override
  void dispose() {
    _productController.close();
    _categoryController.close();
  }
}
