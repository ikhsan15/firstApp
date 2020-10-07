import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.adb,
          color: Colors.white,
        ),
        title: Text(
          "My Flutter Web",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {})
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff0096ff), Color(0xff6610f2)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight),
              image: DecorationImage(
                  image: AssetImage("assets/images/pattern.jpg"),
                  fit: BoxFit.none,
                  repeat: ImageRepeat.repeat)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff0096ff), Color(0xff6610f2)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                elevation: 10,
                child: ListView(
                  children: [
                    // child:
                    Stack(
                      children: [
                        Opacity(
                          opacity: 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v300-ning-22-patterns_2.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=7bc5e3f0bb7e04e67e5e81ce542a9442",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://i.ibb.co/PY7pqMS/IMG-20191214-221324.jpg",
                              ),
                              fit: BoxFit.contain,
                              repeat: ImageRepeat.repeat,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              20,
                              50 + MediaQuery.of(context).size.height * 0.35,
                              20,
                              20),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "beautiful sakura at japan ",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFF56D5D), fontSize: 25),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Posted on ",
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Text(
                                        "September 12, 2024",
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFFF56D5D),
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Spacer(
                                      flex: 10,
                                    ),
                                    Icon(
                                      Icons.thumb_up,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "99",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Spacer(
                                      flex: 5,
                                    ),
                                    Icon(
                                      Icons.comment,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "989",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Spacer(
                                      flex: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
