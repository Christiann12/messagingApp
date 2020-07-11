import 'package:flutter/material.dart';
import 'package:messagingapp/screens/homescreen.dart';
import 'package:messagingapp/screens/login.dart';
import 'package:messagingapp/screens/registerui.dart';
import 'package:provider/provider.dart';
import 'classes/user.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user != null ? Homescreen() : RegisterUi(); //Login();
  }
}
