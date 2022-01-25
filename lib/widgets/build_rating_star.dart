import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

buildRatingStars(rating) {
  return RatingBar.builder(
    initialRating: rating,
    itemSize: 25,
    itemCount: 5,
    allowHalfRating: true,
    itemBuilder: (context, index) {
      return const Icon(
        Icons.star,
        color: Colors.amber,
      );
    },
    onRatingUpdate: (rating) {
      debugPrint(rating.toString());
    },
  );
}
