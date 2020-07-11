import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messagingapp/process/authProcess.dart';
import 'package:messagingapp/screens/registerui.dart';
import 'package:messagingapp/wrapper.dart';
import 'package:provider/provider.dart';
import 'classes/user.dart';

final databaseReference = Firestore.instance;

void main() => runApp(Root());

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthProcess().user,
      child: MaterialApp(home: Wrapper()),
    );
  }
}
