import 'package:flutter/material.dart';
import 'package:messagingapp/classes/constants.dart';
import 'package:messagingapp/process/authProcess.dart';
import 'package:messagingapp/screens/login.dart';

AuthProcess _auth = AuthProcess();

class RegisterUi extends StatefulWidget {
  @override
  _RegisterUiState createState() => _RegisterUiState();
}

class _RegisterUiState extends State<RegisterUi> {

  String email;
  String password;

  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 145.0,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 80.0),
                      child: Image(
                        image: AssetImage('images/register(upperpart).png'),
                      ),
                    ),
                    Positioned(
                      top: 40.0,
                      left: 15.0,
                      child: GestureDetector(
                          child: Icon(
                          Icons.arrow_back_ios,
                          size: 30.0,
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      top: 80.0,
                      left: 35.0,
                      child: Text(
                        'Create',
                        style: ktitleTextStyleRegister,
                      ),
                    ),
                    Positioned(
                      top: 110.0,
                      left: 35.0,
                      child: Text(
                        'your account',
                        style: ktitleTextStyleRegister,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 50.0,
                  left: 40.0,
                  right: 40.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Name',
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
                margin: EdgeInsets.only(
                  top: 30.0,
                  left: 40.0,
                  right: 40.0,
                ),
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
                        onChanged: (val){
                          email = val;
                          print(email);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  left: 40.0,
                  right: 40.0,
                ),
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
                      ],
                    ),
                    Container(
                      height: 30.0,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                        onChanged: (val){
                          password = val;
                          print(password);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
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
                          Row(
                            children: <Widget>[
                              Text(
                                'I agree to the ',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              ),
                              Text(
                                'terms and conditions ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage('images/register(lowerpart).png'),
                    ),
                  ),
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: <Widget>[
                              MaterialButton(
                                height: 50.0,
                                onPressed: () async {
                                  
                                  if(email != null && password != null){
                                    if(password.length < 6){
                                      print('password should be morethan or equal to 6 characters');
                                    }
                                    else{
                                      dynamic result = await _auth.registerEmailAndPassword(email, password);
                                      
                                      if(result == null){
                                        print('error');
                                      }
                                      else{
                                        Navigator.pop(context);
                                      }
                                    }
                                  }
                                  else{
                                    print('all fields should be filled');
                                  }
                                },
                                color: kgobutton,
                                textColor: Colors.white,
                                child: Text('Go', style: kbuttontxtstyle),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Already have account?  ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text('Sign in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration:
                                    TextDecoration.underline)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
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
