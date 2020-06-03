import 'package:shopnew/exception/exception.dart';

class ProductCategory{
  int category_id;
  String category_name, image_direction, image_url;

 ProductCategory(this.category_id, this.category_name, this.image_direction,
     this.image_url);

 ProductCategory.fromJson(Map<String,dynamic>jsonObject){
   if (jsonObject['category_id'] == null) {
     throw PropertyRequired('category_id');
   }
   if (jsonObject['category_name'] == null) {
     throw PropertyRequired('category_name');
   }
   if (jsonObject['image_direction'] == null) {
     throw PropertyRequired('image_direction');
   }
   if (jsonObject['image_url'] == null) {
     throw PropertyRequired('image_url');
   }


   this.category_id = jsonObject['category_id'];
   this.category_name = jsonObject['category_name'];
   this.image_direction = jsonObject['image_direction'];
   this.image_url = jsonObject['image_url'];
 }
}
