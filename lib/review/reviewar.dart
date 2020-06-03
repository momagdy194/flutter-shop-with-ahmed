import 'package:shopnew/exception/exception.dart';

class Reviewer{
 String first_name ,last_name,email,formatted_name;

 Reviewer(this.first_name, this.last_name,this.email, this.formatted_name);

 Reviewer.fromJson(Map<String,dynamic>jsonObject){
   if (jsonObject['first_name'] == null) {
     throw PropertyRequired('first_name');
   }
   if (jsonObject['last_name'] == null) {
     throw PropertyRequired('last_name');
   }
   if (jsonObject['email'] == null) {
     throw PropertyRequired('email');
   }
   if (jsonObject['formatted_name'] == null) {
     throw PropertyRequired('formatted_name');
   }


   this.first_name=jsonObject['first_name'];
   this.last_name=jsonObject['last_name'];
   this.email=jsonObject['email'];
   this.formatted_name=jsonObject['formatted_name'];
 }

}