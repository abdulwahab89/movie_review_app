import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie_review_app/Screens/star_rating.dart';

class MovieScreen extends StatefulWidget {
  String title;
  String movie_description;
  String movie_year;
  String image_url;
  var movie_rating;
  MovieScreen({
    Key? key,
    required this.title,
    required this.movie_description,
    required this.movie_year,
    required this.image_url,
    required this.movie_rating,
  }) : super(key: key);
  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.image_url.toString()))),
          ),
          Expanded(
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 100,
                      child: Row(
                        children: [
                          const Icon(Icons.movie_outlined),
                          Text(
                            " " + widget.movie_year.toString(),
                          ),
                        ],
                      ),
                    ),
                    title: Container(
                      width: 100,
                      child: Text(
                        widget.title.toString(),
                        style: const TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ),
                    subtitle: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final double rating = widget.movie_rating;
                        return StarRating(rating: rating, starCount: 5);
                      },
                    ),
                    trailing: Text(
                      "Rating: " + widget.movie_rating.toString(),
                    ),
                  ),
                  Icon(Icons.favorite_border_outlined),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      ' Description:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(widget.movie_description.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
