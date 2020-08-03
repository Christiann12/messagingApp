import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messagingapp/process/authProcess.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final AuthProcess _auth = AuthProcess();

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('~ kk:mm').format(now);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset('images/tzuyu.jpg'),
          ),
        ),
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.photo_camera,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(Icons.edit, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Container(
                height: 35.0,
                child: TextField(
                  cursorColor: Colors.grey[600],
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: false,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0),
              height: 90.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ListviewIcons(
                    name: 'Mina',
                    photoPath: 'images/mina2.jpg',
                  ),
                  ListviewIcons(
                    name: 'Momo',
                    photoPath: 'images/momo.jpg',
                  ),
                  ListviewIcons(
                    name: 'Chaeyoung',
                    photoPath: 'images/chaeyoung.jpg',
                  ),
                  ListviewIcons(
                    name: 'Dahyun',
                    photoPath: 'images/dahyun2.jpg',
                  ),
                  ListviewIcons(
                    name: 'Jeongyeon',
                    photoPath: 'images/jeongyeon.jpg',
                  ),
                  ListviewIcons(
                    name: 'Irene',
                    photoPath: 'images/irene2.png',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              height: 70.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: Image.asset('images/chaeyoung.jpg'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        'Son Chae-young',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          Text(
                            'HAHAHAHA <3 <3',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '$formattedDate',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 40.0),
                  Icon(
                    Icons.check_circle,
                    size: 20.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(top: 10.0),
          height: 60.0,
          child: GestureDetector(
            onTap: () {
              Alert(
                  context: context,
                  title: "Find friends",
                  content: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.account_circle),
                          labelText: 'Username',
                        ),
                      ),
                    ],
                  ),
                  buttons: [
                    DialogButton(
                      color: Color(0xFF85624E),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Send Request",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ]).show();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.message),
                    Text('Chats'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.people),
                    Text('People'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListviewIcons extends StatelessWidget {
  ListviewIcons({@required this.name, @required this.photoPath});

  final String photoPath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      height: 80.0,
      width: 70.0,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(70.0),
            child: Image.asset('$photoPath'),
          ),
          Text(
            '$name',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
