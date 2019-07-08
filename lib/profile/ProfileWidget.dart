import 'package:flutter/material.dart';
import 'package:m_walk/profile/moduls/Profile.dart';
import 'package:m_walk/color/Palette.dart';

class ProfileWidget extends StatelessWidget {
  final Profile data;

  ProfileWidget({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.blueSky,
        title: Text("Profile"),
      ),
      body: Container(
        child: getBody(data),
      ),
    );
  }

  getBody(Profile profile) {
    if (profile.image != null) {
      return new Image.network(profile.image);
    }
    else {
      return Text(profile.name);
    }
  }
}

