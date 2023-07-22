import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_review_app/Screens/Movie_Screen.dart';
import 'package:movie_review_app/Screens/pop_up_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final database = FirebaseDatabase.instance.ref('Movies');
  Future<dynamic> downloadUrlExample() async {
    final downloadUrl = await FirebaseStorage.instance
        .ref('/movie_image/')
        .child('75')
        .getDownloadURL();
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (_) => const PopUpScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Movies',
                style: TextStyle(
                  fontSize: 25,
                ),
              )),
          Expanded(
            child: FirebaseAnimatedList(
                query: database,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, snapshot, animation, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieScreen(
                              title:
                                  snapshot.child('movie_name').value.toString(),
                              movie_description: snapshot
                                  .child('movie_description')
                                  .value
                                  .toString(),
                              movie_year:
                                  snapshot.child('movie_year').value.toString(),
                              image_url:
                                  snapshot.child('image_url').value.toString(),
                              movie_rating: double.parse(snapshot
                                  .child('movie_rating')
                                  .value
                                  .toString()),
                            ),
                          ));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .5,
                            width: MediaQuery.of(context).size.width * .6,
                            child: Image(
                              errorBuilder: (context, error, stacktrace) {
                                return Icon(Icons.warning);
                              },
                              image: NetworkImage(
                                  snapshot.child('image_url').value.toString()),
                            ),
                          ),
                          Text(
                            '   ' +
                                snapshot.child('movie_name').value.toString(),
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '   ' +
                                snapshot.child('movie_year').value.toString(),
                            style: TextStyle(
                              fontSize: 21,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// InkWell(
//     onTap: () {
//       showDialog(context: context, builder: (_) => PopUpScreen());
//     },
//     child: Text('Empty')),
