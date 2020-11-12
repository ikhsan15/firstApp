import 'package:flutter/material.dart';

class Pekanlima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    Text(
                      "My Public Profile",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff0096ff), Color(0xff6610f2)],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100),
        ),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              margin: EdgeInsets.only(top: 20, bottom: 15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.contain,
                    image: new NetworkImage(
                        "https://i.ibb.co/PY7pqMS/IMG-20191214-221324.jpg"),
                    repeat: ImageRepeat.repeat),
              ),
            ),
            Container(
              child: SizedBox(
                height: 50,
                child: Image.asset('assets/images/medali.png'),
              ),
            ),
            Column(
              children: [
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 40.0,
                    ),
                    title: Text(
                      "Nama",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    subtitle: Text(
                      "Ikhsan Nur",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.message,
                      size: 40.0,
                    ),
                    title: Text(
                      "Tag line",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    subtitle: Text(
                      "Hey there, Saya akan terus mencoba",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
