import 'package:shopnew/exception/exception.dart';

class CountryCity {
  int city_id;
  String city_name;

  CountryCity(this.city_id, this.city_name);

  CountryCity.fromJson(Map<String,dynamic>jsonObject){
    if (jsonObject['city_id'] == null) {
      throw PropertyRequired('city_id');
    }
    if (jsonObject['city_name'] == null) {
      throw PropertyRequired('city_name');
    }


    this.city_id=jsonObject['city_id'];
    this.city_name=jsonObject['city_name'];
  }
}
