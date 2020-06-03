import 'package:shopnew/exception/exception.dart';

class CountryState {
  int state_id;
  String state_name;

  CountryState(this.state_id, this.state_name);

  CountryState.fromJson(Map<String, dynamic> jsonObject) {
    if (jsonObject['state_id'] == null) {
      throw PropertyRequired('state_id');
    }
    if (jsonObject['state_name'] == null) {
      throw PropertyRequired('state_name');
    }

    this.state_id = jsonObject['state_id'];
    this.state_name = jsonObject['state_name'];
  }
}
