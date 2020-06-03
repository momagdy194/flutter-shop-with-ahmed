import 'dart:convert';

import 'package:shopnew/Api/api_utl.dart';
import 'package:shopnew/customer/user.dart';
import 'package:http/http.dart' as http;
import 'package:shopnew/exception/exception.dart';


Map<String, String> header = {"Accept": "application/json"};

class Authentication {

  Future<User> register(String first_name, String last_name, String email,
      String password) async {
    await checkInterNetConnection();

    Map<String, String> body = {
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password": password,
    };
    http.Response response =
        await http.post(ApiUtil.AUTH_REGISTER_URL, body: body, headers: header);
    switch (response.statusCode) {
      case 201:
        var body = jsonDecode(response.body);
        var data = body['data'];
        return User.fromJson(data);
        break;
      case 404:
        throw RegisterException();
    }
    return null;
  }

  Future<User> login(String email, String password) async {
    await checkInterNetConnection();

    Map<String, String> body = {'email': email, 'password': password};
    http.Response response =
        await http.post(ApiUtil.AUTH_LOGIN_URL, headers: header, body: body);
switch(response.statusCode ){
  case 200: var body = jsonDecode(response.body);
  var data = body['data'];
  return User.fromJson(data);
  break;
  case 404: throw LoginFaild();
  break;
  case 301:
  case 302:
  case 303:
throw RedurectionFound();
break;
}return null;
  }
}
