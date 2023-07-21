import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_review_app/firebase_services/firebase/firebase_services.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PopUpScreen extends StatefulWidget {
  const PopUpScreen({Key? key}) : super(key: key);

  @override
  State<PopUpScreen> createState() => _PopUpScreenState();
}

class _PopUpScreenState extends State<PopUpScreen> {
  final _movieNameController = TextEditingController();
  final _movieYearController = TextEditingController();
  final _movieDescriptionController = TextEditingController();
  final _ratingController = TextEditingController();
  File? _image;
  final imagePicker = ImagePicker();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  FirebaseServices services = FirebaseServices();
  Future getImageGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  File getImagePath() {
    return _image!.absolute;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                AppBar(
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Close the dialog when close button is pressed
                      },
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    getImageGallery();
                  },
                  child: SizedBox(
                    height: 200,
                    child: _image != null
                        ? Image.file(
                            _image!.absolute,
                          )
                        : Icon(Icons.image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _movieNameController,
                    decoration: InputDecoration(
                        hintText: 'Enter movie name',
                        border: OutlineInputBorder()),
                  ),
                ),
                TextFormField(
                  controller: _movieYearController,
                  decoration: InputDecoration(
                      hintText: 'Enter movie year',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _movieDescriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Description', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Rating'),
                    SizedBox(
                      width: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 40,
                        width: 60,
                        child: TextFormField(
                          controller: _ratingController,
                          decoration: InputDecoration(
                            hintText: '1/5',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                    onTap: () async {
                      firebase_storage.Reference ref = firebase_storage
                          .FirebaseStorage.instance
                          .ref('/movie_image/' +
                              DateTime.now().millisecond.toString());
                      firebase_storage.UploadTask uploadTask =
                          ref.putFile(_image!.absolute);
                      await Future.value(uploadTask);
                      var url = await ref.getDownloadURL();
                      services.uploadData(
                          _movieNameController.text.toString(),
                          _movieYearController.text.toString(),
                          _movieDescriptionController.text.toString(),
                          _ratingController.text.toString(),
                          url.toString(),
                          context);
                    },
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.send,
                          color: Colors.blue,
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
