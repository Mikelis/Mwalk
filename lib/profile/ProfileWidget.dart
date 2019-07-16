import 'package:flutter/material.dart';
import 'package:m_walk/profile/moduls/Profile.dart';
import 'package:m_walk/color/Palette.dart';

class ProfileWidget extends StatelessWidget {
  final Profile data;

  ProfileWidget({this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[new Expanded(child: getBody(data))] ,
    );
  }

  Widget getBody(Profile profile) {
    if (profile.image != null) {
      return new Image.network(profile.image);
    } else {
      return Text(profile.name);
    }
//    else {
//      return FlatButton(
//          onPressed: () => {
//                uploadProfilePic(profile.name).then((value) => value.toString())
//              },
//          color: Palette.greenLand,
//          child: new Text("Upload Profile Image"));
//    }
  }
}
