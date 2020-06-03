import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopnew/Api/authantiction.dart';
import 'package:shopnew/Api/helper_api.dart';
import 'package:shopnew/Api/product_api.dart';
import 'package:shopnew/product/product.dart';
import 'package:shopnew/product/product_category.dart';
import 'package:shopnew/product/product_tag.dart';
import 'package:shopnew/screen/home_page.dart';
import 'package:shopnew/screen/on_boarding/on_boarding_screen.dart';
import 'package:shopnew/utility/country.dart';
import 'package:shopnew/utility/country_city.dart';
import 'package:shopnew/utility/country_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs=await SharedPreferences.getInstance();
  bool isSeen=prefs.getBool('isSeen');
  Widget homePage=HomePage();
  if(isSeen==null ||!isSeen){
homePage=OnBoardingScreen();
  }

  return runApp(GeneralShop(homePage));
}

class GeneralShop extends StatelessWidget {
  Widget homePage;
  GeneralShop(this.homePage);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: homePage,
    );
  }

}

//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//ProductApi productApi = ProductApi();
//HelperApi helperApi = HelperApi();
//Authentication authentication = Authentication();
//
//class _HomePageState extends State<HomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//          child: FutureBuilder(
//        future: helperApi.fetchCategory(),
//        builder: (BuildContext context, AsyncSnapshot snapShot) {
//          switch (snapShot.connectionState) {
//            case ConnectionState.none:
//              return _erore('errore');
//              break;
//            case ConnectionState.waiting:
//              return _loading();
//              break;
//            case ConnectionState.active:
//              return _loading();
//              break;
//            case ConnectionState.done:
//              if (snapShot.hasError) {
//                return _erore(snapShot.error.toString());
//              } else if (!snapShot.hasData) {
//                return _erore('nodata');
//              } else {
//                return ListView.builder(
//                  itemBuilder: (BuildContext context, int position) {
//                    ProductCategory category = snapShot.data[position];
//                    print(category.image_url);
//                return Text(category.category_name);
//                  },
//                  itemCount: snapShot.data.length,
//                );
//              }
//              break;
//          }
//          return Container();
//        },
//      )),
//    );
//  }
//
//  _drawRightproduct(ProductCategory country) {
//    return Card(
//        child: Row(
//      children: <Widget>[
//        Text(country.category_name),
//        Flexible(child: Image(image: NetworkImage(country.image_url)))
//      ],
//    ));
//  }
//
//  _drawLeftproduct(dynamic country) {
//    return Card(
//        child: Row(
//      children: <Widget>[
//        Flexible(child: Image(image: NetworkImage(country.image_url))),
//        Text(country.category_name),
//      ],
//    ));
//  }
//
//  Widget _erore(String text) {
//    return Center(child: Text(text));
//  }
//
//  Widget _loading() {
//    return Center(child: CircularProgressIndicator());
//  }
//}
