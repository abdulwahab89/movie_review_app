import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:movie_review_app/utils/utils.dart';

class FirebaseServices {
  final ref = FirebaseDatabase.instance.ref('Movies');
  Future uploadData(String movieName, String movieYear, String movieDescription,
      String movieRating, String imageUrl, BuildContext context) async {
    String id = DateTime.now().second.toString();
    ref.child(id).set({
      'id': id,
      'movie_name': movieName.toString(),
      'movie_year': movieYear.toString(),
      'movie_description': movieDescription.toString(),
      'movie_rating': movieRating.toString(),
      'image_url': imageUrl,
    }).then((value) {
      Utils.messageBar('uploaded movie');
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      Utils.messageBar(error.toString());
    });
  }
}
