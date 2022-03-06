import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:peerreview/config/config.dart';
import 'package:peerreview/widgets/auth/login.dart';
import 'package:peerreview/widgets/auth/logout.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: cfg['oAuthCliId'],
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State createState() => MainState();
}

class MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Logout(googleSignIn: _googleSignIn) //, user: user,)
            ],
          ),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Login(
            googleSignIn: _googleSignIn,
          ),
        ));
  }
}
