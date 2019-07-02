import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';

StreamBuilder<QuerySnapshot> getMales(BuildContext context) {
  var snapshot = Firestore.instance.collection("males").snapshots();
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
                var image = document['image'];
                var url = FirebaseStorage.instance
                    .ref()
                    .child(image)
                    .getDownloadURL();
                url.then((result) {
                  return new Image.network(result);
                }).catchError((error, stack) {});
              }).toList(),
            );
        }
      });
}
