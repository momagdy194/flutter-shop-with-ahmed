import 'package:flutter/material.dart';
import 'package:shopnew/Api/helper_api.dart';
import 'package:shopnew/product/homepage_stream.dart';
import 'package:shopnew/product/product.dart';
import 'package:shopnew/product/product_category.dart';
import 'package:shopnew/utilites/screenconfigration.dart';
import 'package:shopnew/utilites/widget_utility.dart';

ScreenConfig screenConfig;
Widgetsize widgetSize;
HelperApi helperApi = HelperApi();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController tabController;
  int currentIndex = 0;
  List<ProductCategory> productCategories;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: helperApi.fetchCategory(),
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.none:
            return erore('no Internet connection');
            break;
          case ConnectionState.waiting:
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.done:
            if (snapShot.hasError) {
              return erore(snapShot.error.toString());
            } else if (!snapShot.hasData) {
              return erore('has not data');
            } else {
              this.productCategories = snapShot.data;
              homeProductBlock.fetchProduct.add(this.productCategories[0].category_id);
              return _screen(snapShot.data);
            }
            break;
        }
        return Container();
      },
    );
  }

  HomeProductBlock homeProductBlock = HomeProductBlock();

  Widget _screen(List<ProductCategory> categories) {
    tabController = TabController(
        length: categories.length, vsync: this, initialIndex: currentIndex);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
        centerTitle: true,
        actions: <Widget>[Icon(Icons.search)],
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          indicatorWeight: 4,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          tabs: _tabs(categories),
          isScrollable: true,
          controller: tabController,
          onTap: (int index) {
            homeProductBlock.fetchProduct
                .add(this.productCategories[index].category_id);
          },
        ),
      ),
      body: StreamBuilder(
          stream: homeProductBlock.productStream,
          builder: (BuildContext context, AsyncSnapshot snapShot) {
            switch (snapShot.connectionState) {
              case ConnectionState.none:
                return erore('no loading');
                break;
              case ConnectionState.waiting:
                return loading();
                break;
              case ConnectionState.done:
              case ConnectionState.active:

                if (snapShot.hasError) {
                  return Text(snapShot.error.toString());
                } else if (!snapShot.hasData) {
                  return Text('no Data');
                } else {
                  return _drawProduct(snapShot.data);
                }

                break;
            }
            return Container();
          }),
    );
  }

  _drawProduct(List<Product> product) {
    return Center(
      child: Text('bbbbbbbbbb'),
    );
  }

  List _tabs(List<ProductCategory> categories) {
    List<Tab> tabs = [];
    for (ProductCategory category in categories) {
      tabs.add(Tab(
        text: category.category_name,
      ));
    }
    return tabs;
  }
}
