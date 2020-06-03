import 'package:shopnew/exception/exception.dart';

class User {
  int user_id;
  String first_name, last_name, email, api_token;

  User( this.first_name, this.last_name, this.email,
      [this.api_token,this.user_id]);
  User.fromJson(Map<String,dynamic>jsonObject){
    if (jsonObject['user_id'] == null) {
      throw PropertyRequired('user_id');
    }
    if (jsonObject['first_name'] == null) {
      throw PropertyRequired('first_name');
    }
    if (jsonObject['last_name'] == null) {
      throw PropertyRequired('last_name');
    }
    if (jsonObject['email'] == null) {
      throw PropertyRequired('email');
    }
    if (jsonObject['api_token'] == null) {
      throw PropertyRequired('api_token');
    }


    this.user_id=jsonObject['user_id'];
    this.first_name=jsonObject['first_name'];
    this.last_name=jsonObject['last_name'];
    this.email=jsonObject['email'];
    this.api_token=jsonObject['api_token'];
  }


}
