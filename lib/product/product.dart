import 'package:shopnew/exception/exception.dart';
import 'package:shopnew/product/product_category.dart';
import 'package:shopnew/product/product_tag.dart';
import 'package:shopnew/product/product_unit.dart';
import 'package:shopnew/review/product_review.dart';

class Product {
  int product_id;
  String product_title,
      product_description,
      product_price,
      product_total,
      product_discount;
  ProductUnit productUnit;
  ProductCategory productCategory;
  List<ProductTag> tag;
  List<String> images;
  List<ProductReview> reviews;

  Product(
      this.product_id,
      this.product_description,
      this.productUnit,
      this.product_price,
      this.product_total,
      this.product_discount,
      this.productCategory,
      this.tag,
      this.images,
      this.reviews);

  Product.fromJson(Map<String, dynamic> jsonObject) {
    if (jsonObject['product_id'] == null) {
      throw PropertyRequired('product_id');
    }
    if (jsonObject['product_title'] == null) {
      throw PropertyRequired('product_title');
    }
    if (jsonObject['product_description'] == null) {
      throw PropertyRequired('product_description');
    }
    if (jsonObject['product_price'] == null) {
      throw PropertyRequired('product_price');
    }
    if (jsonObject['product_discount'] == null) {
      throw PropertyRequired('product_discount');
    }
    if (jsonObject['product_total'] == null) {
      throw PropertyRequired('product_total');
    }
    if (jsonObject['product_category'] == null) {
      throw PropertyRequired('product_category');
    }

    this.product_id = jsonObject['product_id'];
    this.product_title = jsonObject['product_title'];

    this.product_description = jsonObject['product_description'];

    this.product_price = jsonObject['product_price'].toString();

    this.product_discount = jsonObject['product_discount'].toString();

    this.product_total = jsonObject['product_total'].toString();
    this.productCategory =
        ProductCategory.fromJson(jsonObject['product_category']);
    this.images = [];
    if (jsonObject['product_images'] != null) {
      _set_images(jsonObject['product_images']);
    }

    this.reviews = [];
    if (jsonObject['product_review'] != null) {
      _setReview(jsonObject['product_review']);
    }
    this.tag = [];
    if (jsonObject['product_tag'] != null) {
      _setTag(jsonObject['product_tag']);
    }
  }

  void _setReview(List<dynamic> reviewerJason) {
    this.reviews = [];
    if (reviewerJason.length > 0) {
      for (var item in reviewerJason) {
        if (item != null) {
          this.reviews.add(ProductReview.fromJson(item));
        }
      }
    }
  }

  void _setTag(List<dynamic> tagJson) {
    this.tag = [];
    if (tagJson.length > 0) {
      for (var item in tagJson) {
        if (item != null) {
          tag.add(ProductTag.fromJson(item));
        }
      }
    }
  }

  void _set_images(List<dynamic> jsonImages) {
    this.images = [];
    if (jsonImages.length > 0) {
      for (var image in jsonImages) {
        if (image != null) {
          this.images.add(image['image_url']);
        }
      }
    }
  }
}
