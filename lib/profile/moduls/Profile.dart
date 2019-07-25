import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {

  final String name;
  final String surname;
  final String image;
  final String description;
  final String id;

  Profile(this.name, this.surname, this.image, this.description, this.id);

  Profile.fromJson(DocumentSnapshot snapshot)
      : name = snapshot.data['name'],
        surname = snapshot.data['surname'],
        image = snapshot.data["image"],
        description = snapshot.data["description"],
        id = snapshot.documentID;
}