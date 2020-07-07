import 'package:flutter/material.dart';
import 'package:messagingapp/constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var checkBoxValue = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    'images/topside.png',
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    left: 30.0,
                    top: 60.0,
                    child: Text(
                      'Log into',
                      style: ktitleTextStyle,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 30.0,
                    child: Text(
                      'your account',
                      style: ktitleTextStyle,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'E-mail',
                      style: kinputTextStyle,
                    ),
                    Container(
                      height: 30.0,
                      child: TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Password',
                          style: kinputTextStyle,
                        ),
                        Text(
                          'Forgot?',
                          style: TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    Container(
                      height: 30.0,
                      child: Stack(children: <Widget>[
                        Positioned(
                          right: 1.0,
                          bottom: 1.0,
                          child: Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: checkBoxValue,
                        activeColor: Colors.blue,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue = newValue;
                          });
                        }),
                    Text(
                      'Remember me',
                      style: TextStyle(color: Colors.grey, fontSize: 10.0),
                    )
                  ],
                ),
              ),
              Center(
                child: MaterialButton(
                  height: 50.0,
                  onPressed: () {},
                  color: kgobutton,
                  textColor: Colors.white,
                  child: Text('Go', style: kbuttontxtstyle),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Dont have an account?'),
                  SizedBox(width: 5.0),
                  Text(
                    'Sign up',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xFF85624E),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}