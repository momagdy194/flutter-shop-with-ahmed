import 'package:shopnew/exception/exception.dart';

class Country {
  int country_id;
  String country_name, capital, currency;


  Country(this.country_id, this.country_name, this.capital, this.currency);

  Country.fromJson(Map<String,dynamic>jsonObject){
    if (jsonObject['country_id'] == null) {
      throw PropertyRequired('country_id');
    }
    if (jsonObject['country_name'] == null) {
      throw PropertyRequired('country_name');
    }
    if (jsonObject['capital'] == null) {
      throw PropertyRequired('capital');
    }
    if (jsonObject['currency'] == null) {
      throw PropertyRequired('currency');
    }

    this.country_id=jsonObject['country_id'];
    this.country_name=jsonObject['country_name'];
    this.capital=jsonObject['capital'];
    this.currency=jsonObject['currency'];
  }
}
