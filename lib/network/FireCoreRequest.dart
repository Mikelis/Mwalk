import 'dart:io';

import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import "package:m_walk/profile/ProfileWidget.dart";
import 'package:m_walk/profile/moduls/Profile.dart';
import 'package:image_picker/image_picker.dart';

StreamBuilder<QuerySnapshot> getProfile(BuildContext context) {
  var snapshot = Firestore.instance.collection("user").snapshots();
  return StreamBuilder(
      stream: snapshot,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
              return ProfileWidget(data: Profile.fromJson(document.data));
            }).toList());
        }
      });
}

Future<dynamic> uploadProfilePic(String imageId) async {
  File imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
  StorageReference ref =
      FirebaseStorage.instance.ref().child("profile_images").child(imageId);
  StorageUploadTask uploadTask = ref.putFile(imageFile);
  return (await uploadTask.onComplete).ref.getDownloadURL();
}
