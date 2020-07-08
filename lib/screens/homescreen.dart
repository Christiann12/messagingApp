import 'package:flutter/material.dart';
import 'package:messagingapp/process/authProcess.dart';

final AuthProcess _auth = AuthProcess();

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'homescreen',
              style: TextStyle(color: Colors.white,
              ),
            ),
            RaisedButton(
              child: Text('Sign out'),
              onPressed: () {
                _auth.signOut();
              }
            )
          ],
        )
    )
    );
  }
}