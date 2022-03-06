import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Logout extends StatefulWidget {
  final GoogleSignIn googleSignIn;

  const Logout({
    Key? key,
    required this.googleSignIn,
  }) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  Future<void> _handleSignOut() => widget.googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: _handleSignOut, icon: const Icon(Icons.logout));
  }
}
