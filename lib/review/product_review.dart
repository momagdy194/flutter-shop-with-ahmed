import 'package:shopnew/exception/exception.dart';
import 'package:shopnew/review/reviewar.dart';

class ProductReview {
  int review_id, stars;
  String review;
  Reviewer reviewer;

  ProductReview(this.review_id, this.stars, this.review, this.reviewer);

  ProductReview.fromJson(Map<String, dynamic> jsonObject) {
    if (jsonObject['review_id'] == null) {
      throw PropertyRequired('review_id');
    }
    if (jsonObject['stars'] == null) {
      throw PropertyRequired('stars');
    }
    if (jsonObject['review'] == null) {
      throw PropertyRequired('review');
    }
    if (jsonObject['reviewer'] == null) {
      throw PropertyRequired('reviewer');
    }

    this.review_id = jsonObject['review_id'];
    this.stars = jsonObject['stars'];
    this.review = jsonObject['review'];
    this.reviewer = Reviewer.fromJson(jsonObject['reviewer']);
  }
}
