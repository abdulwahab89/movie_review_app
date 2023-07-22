import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;

  StarRating({required this.rating, required this.starCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.yellow,
        );
      }),
    );
  }
}
