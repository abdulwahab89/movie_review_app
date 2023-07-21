import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
          showDialog(context: context, builder: (_) => PopUpScreen());
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: database,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, snapshot, animation, int index) {
                  return Column(
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
                    ],
                  );
                }),
          )
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
