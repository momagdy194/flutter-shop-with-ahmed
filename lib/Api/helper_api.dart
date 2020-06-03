import 'dart:convert';
import 'package:connectivity/connectivity.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shopnew/Api/api_utl.dart';
import 'package:shopnew/Api/authantiction.dart';
import 'package:shopnew/exception/exception.dart';
import 'package:shopnew/product/product.dart';
import 'package:shopnew/product/product_category.dart';
import 'package:http/http.dart' as http;
import 'package:shopnew/product/product_tag.dart';
import 'package:shopnew/utility/country.dart';
import 'package:shopnew/utility/country_city.dart';
import 'package:shopnew/utility/country_state.dart';

class HelperApi {

  Future<List<ProductCategory>> fetchCategory() async {
  await checkInterNetConnection();
    String url = ApiUtil.CATEGORY ;
    http.Response response = await http.get(url, headers: header);

    switch (response.statusCode) {
      case 200:
        List<ProductCategory> catogries = [];
        if (response.statusCode == 200) {
          var body = jsonDecode(response.body);
          for (var item in body['data']) {
            ProductCategory catogerty = ProductCategory.fromJson(item);
            catogries.add(catogerty);
          }
        }
        return catogries;

        break;
      case 404:
        throw ResourceNotFound(' Product Category not Found');
        break;
      case 301:
      case 302:
      case 303:
        throw RedurectionFound();
        break;
    }
  }



  Future<List<ProductTag>> fetchTags(int page) async {
    await checkInterNetConnection();

    await checkInterNetConnection();
    String url = ApiUtil.TAGS + '?page=' + page.toString();

    http.Response response = await http.get(url, headers: header);
    List<ProductTag>tag = [];
    switch (response.statusCode) {
      case 200:
        var body = jsonDecode(response.body);
        var data = body['data'];
        for (var item in data) {
          tag.add(ProductTag.fromJson(item));
        }
        return tag;
        break;
      case 404:throw ResourceNotFound('ProductTag not found');
      break;
      case 301:
      case 302:
      case 303:
        throw RedurectionFound();
        break;
    }
  }

  Future<List<Country>> fetchCountries(int page) async {
    await checkInterNetConnection();

    String url = ApiUtil.COUNTRIES + '?page=' + page.toString();
    http.Response response = await http.get(url, headers: header);
    List <Country> country = [];

    switch(response.statusCode ){
      case 200:    var body = jsonDecode(response.body);
      var data = body['data'];
      for (var item in data) {
        country.add(Country.fromJson(item));
      }
      return country;
      break;
      case 404:ResourceNotFound('Country  NotFound');
      break;
      case 301:
      case 302:
      case 303:
        throw RedurectionFound();
        break;
    }

  }

  Future<List<CountryState>> fetchStates(int countery, int page) async {
    await checkInterNetConnection();

    String url = ApiUtil.STATES(countery) + '?page=' + page.toString();
    http.Response response = await http.get(url, headers: header);
    List<CountryState> States = [];

    switch (response.statusCode) {
      case 200:
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          States.add(CountryState.fromJson(item));
        }
        break;
      case 404:ResourceNotFound('CountryState  NotFound');
      break;
      case 301:
      case 302:
      case 303:
        throw RedurectionFound();
        break;
    }
    return States;
  }

  Future<List<CountryCity>> fetchCities(int countery, int page) async {
    await checkInterNetConnection();

    String url = ApiUtil.CITIES(countery) + '?page=' + page.toString();
    http.Response response = await http.get(url, headers: header);
    List<CountryCity> City = [];

    switch (response.statusCode) {
      case 200:
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          City.add(CountryCity.fromJson(item));
        }
        break;
      case 404:ResourceNotFound('CountryCity  NotFound');
      break;
      case 301:
      case 302:
      case 303:
        throw RedurectionFound();
        break;
    }
    return City;
  }

}
