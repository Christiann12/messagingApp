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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(top: 10.0),
          height: 60.0,
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
