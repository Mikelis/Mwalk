import 'package:flutter/material.dart';
import 'package:m_walk/network/FireCoreRequest.dart';
import 'package:m_walk/profile/moduls/Profile.dart';
import 'package:m_walk/color/Palette.dart';

class ProfileWidget extends StatelessWidget {
  final Profile data;

  ProfileWidget({this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[new Expanded(child: getBody(data))],
    );
  }

  Widget getBody(Profile profile) {
    if (profile.image != null) {
      return new Image.network(profile.image);
    } else {
      return new Builder(
          builder: (context) => FlatButton(
              onPressed: () => {
                    uploadProfilePic(profile.id)
                        .then((value) => value.toString())
                  },
              color: Palette.greenLand,
              child: new Text("Upload Profile Image")));
    }
  }
}

https://firebasestorage.googleapis.com/v0/b/tryangle-27376.appspot.com/o/profile_images%2FLHLJgljhE49EGS1AjrdM?alt=media
https://firebasestorage.googleapis.com/v0/b/tryangle-27376.appspot.com/o/profile_images/LHLJgljhE49EGS1AjrdM