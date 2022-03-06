import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'package:peerreview/widgets/temp.dart';

class Login extends StatefulWidget {
  final GoogleSignIn googleSignIn;

  const Login({
    Key? key,
    required this.googleSignIn,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late GoogleSignInAccount account;
  late bool isSignIn;

  Future<bool> _handleSignIn() async {
    try {
      account = (await widget.googleSignIn.signIn())!;
      print(account.email);
      print(account.displayName);
      print(account.id);
      print(account.photoUrl);
      print(account.serverAuthCode);
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
            child: Text(
              'LOGIN',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              isSignIn = await _handleSignIn();
              if (isSignIn) {
                Get.to(Temp(
                  name: account.email,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
