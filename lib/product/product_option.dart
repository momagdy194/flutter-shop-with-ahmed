class ProductOption{
  String optionName;
  List<String>option;
  ProductOption(this.optionName, this.option);
  ProductOption.fromjson(List<Map<String,dynamic>>jsonObject){
   option=[];
    for(var options in jsonObject){
//      option.add(options)
   }
  }
}