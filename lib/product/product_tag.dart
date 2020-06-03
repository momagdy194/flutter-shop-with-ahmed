import 'package:shopnew/exception/exception.dart';

class ProductTag {
  int tag_id;
  String tag_name;

  ProductTag(this.tag_id, this.tag_name);

  ProductTag.fromJson(Map<String, dynamic> jsonObject) {
    if (jsonObject['tag_id'] == null) {
      throw PropertyRequired('tag_id');
    }
    if (jsonObject['tag_name'] == null) {
      throw PropertyRequired('tag_name');
    }

    this.tag_id = jsonObject['tag_id'];
    this.tag_name = jsonObject['tag_name'];
  }
}
