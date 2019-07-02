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
              var key = "image";
              if (document.data.containsKey(key)) {
                var image = document[key];
                return new Image.network(image);
              }
              else {
                return Text("no image");
              }
            }).toList());
        }
      });
}
