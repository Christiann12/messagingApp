import 'package:flutter/material.dart';
import 'package:messagingapp/classes/constants.dart';
import 'package:messagingapp/process/authProcess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

AuthProcess _auth = AuthProcess();

class RegisterUi extends StatefulWidget {
  @override
  _RegisterUiState createState() => _RegisterUiState();
}

class _RegisterUiState extends State<RegisterUi> {
  String email;
  String password;
  DateTime _dateTime;
  String bday;
  String firstName;
  String lastName;
  String gender = 'Gender';

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
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
                        onTap: () {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 130.0,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) {
                        firstName = val;
                      },
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Container(
                    height: 30.0,
                    width: 130.0,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) {
                        lastName = val;
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    height: 30.0,
                    width: 275.0,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 0),
                        prefixIcon: Icon(Icons.mail),
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) {
                        email = val;
                        print(email);
                      },
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 275.0,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 0),
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) {
                        password = val;
                        print(password);
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 30.0,
                    width: 275.0,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 0),
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) {
                        password = val;
                        print(password);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1930, 1, 1),
                              maxTime: DateTime(2020, 7, 17),
                              onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            setState(() {
                              _dateTime = date;
                              bday =
                                  _dateTime.toIso8601String().substring(0, 10);
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 42.0, top: 15.0),
                              height: 30.0,
                              width: 130.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Center(
                                  child: Text(
                                    _dateTime == null
                                        ? 'Birthday'
                                        : _dateTime
                                            .toIso8601String()
                                            .substring(0, 10),
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0, top: 15.0),
                        height: 30.0,
                        width: 130.0,
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: gender,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 15,
                                elevation: 0,
                                underline: Container(
                                  height: 0,
                                  color: Colors.white,
                                ),
                                style: TextStyle(color: Colors.grey[600]),
                                onChanged: (String newValue) {
                                  setState(() {
                                    gender = newValue;
                                  });
                                },
                                items: <String>[
                                  'Gender',
                                  'Male',
                                  'Female',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
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
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 300,
                      child: FittedBox(
                        child: Image(
                          image: AssetImage('images/register(lowerpart).png'),
                        ),
                        fit: BoxFit.fitHeight,
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
                                    if (email != null &&
                                        password != null &&
                                        firstName != null &&
                                        lastName != null &&
                                        bday != null &&
                                        gender != null &&
                                        gender != 'Gender') {
                                      if (password.length < 6) {
                                        print(
                                            'password should be morethan or equal to 6 characters');
                                      } else {
                                        dynamic result = await _auth
                                            .registerEmailAndPassword(
                                                email,
                                                password,
                                                firstName,
                                                lastName,
                                                bday,
                                                gender);

                                        if (result == null) {
                                          print('error');
                                        } else {
                                          Navigator.pop(context);
                                        }
                                      }
                                    } else {
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
                                      onTap: () {
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
