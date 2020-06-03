import 'dart:convert';

import 'package:shopnew/Api/api_utl.dart';
import 'package:shopnew/exception/exception.dart';
import 'package:shopnew/main.dart';
import 'package:shopnew/product/product.dart';
import 'package:http/http.dart' as http;

import 'helper_api.dart';

class ProductApi {
  Map<String, String> header = {"Accept": "application/json"};

  Future<List<Product>> fetchProducts(int page) async {
    await checkInterNetConnection();
    String URL = ApiUtil.PRODUCT_API_URL + '?page = ' + page.toString();
    http.Response response = await http.get(URL, headers: header);
    List<Product> product = [];
    switch (response.statusCode) {
      case 200:
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          product.add(Product.fromJson(item));
        }
        return product;
        break;
      case 404:
        ResourceNotFound('Product NotFound');
        break;
      case 301:
      case 302:
      case 303:
        throw RedurectionFound();
        break;
    }
    return null;
  }

  Future<List<Product>> fetchProductByCategory(int category, int page) async {
    await checkInterNetConnection();

    String url = ApiUtil.CATEGORY_PRODUCTS(category, page);
    http.Response response = await http.get(url, headers: header);
    List<Product> products = [];

    switch (response.statusCode) {
      case 200:
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          products.add(
            Product.fromJson(item),
          );
        }
        return products;
        break;
      case 404:
        throw ResourceNotFound('Products');
        break;

      case 301:
      case 302:
      case 303:
        throw RedurectionFound();
        break;
      default:
        return null;
        break;
    }
  }


  Future<Product> fetchProduct(int id) async {
    await checkInterNetConnection();
    http.Response response = await http
        .get(ApiUtil.PRODUCT_id_API_URL + id.toString(), headers: header);
    switch (response.statusCode) {
      case 200:
        var body = jsonDecode(response.body);
        var data = body['data'];
        return Product.fromJson(data);
        break;
      case 404:
        ResourceNotFound(' Product NotFound');
        break;
      case 301:
      case 302:
      case 303:
        throw RedurectionFound();
        break;
    }
    return null;
  }
}
