import 'package:flutter/material.dart';
import 'package:m_walk/network/FireCoreRequest.dart';
import 'package:m_walk/profile/moduls/Profile.dart';
import 'package:m_walk/color/Palette.dart';

class ProfileWidget extends StatelessWidget {
  final Profile data;

  ProfileWidget({this.data});

  @override
  Widget build(BuildContext context) {
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisSize: MainAxisSize.max,
//      children: <Widget>[
//        getBody(data),
//        new Text(data.name + " " + data.surname),
//        new Text(data.description)
//      ],
//    );
    return Container(
      constraints: BoxConstraints.expand(width: 300),
      color: Palette.greenLand,
      alignment: Alignment.topCenter,
      child: getBody(data)
    );
  }

  Widget getBody(Profile profile) {
    if (profile.image != null) {
      return Image.network(
        profile.image,
        fit: BoxFit.contain,
      );

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
