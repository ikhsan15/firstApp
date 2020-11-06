import 'package:flutter/material.dart';

class Pekanlimaold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.keyboard_arrow_left,
          color: Colors.white,
        ),
        title: Text(
          "My Flutter App",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          // IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
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
                colors: [
                  Color(0xffF1F6F9),
                  Color(0xff394867),
                  Color(0xff14274E),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              // child: Card(
              //   elevation: 10,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    margin: EdgeInsets.only(top: 15),
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
                    margin: EdgeInsets.fromLTRB(20,
                        50 + MediaQuery.of(context).size.height * 0.35, 20, 20),
                    child: TextFormField(),
                  )
                ],
              ),
              // ),
            ),
          )
        ],
      ),
    );
  }
}

// child: Center(
// child: Column(
//   children: [
//     Text(
//       "IKHSAN NUR",
//       maxLines: 2,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//           color: Color(0xFFF56D5D), fontSize: 25),
//     ),
//     Text(
//       "0110218013",
//       maxLines: 2,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//           color: Color(0xFFF56D5D), fontSize: 15),
//     ),
//     Container(
//       margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Posted on ",
//             maxLines: 2,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Colors.grey, fontSize: 12),
//           ),
//           Text(
//             "September 20, 2020",
//             maxLines: 2,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Color(0xFFF56D5D), fontSize: 12),
//           ),
//         ],
//       ),
//     ),
//     Row(
//       children: [
//         Spacer(
//           flex: 10,
//         ),
//         Icon(
//           Icons.thumb_up,
//           size: 18,
//           color: Colors.lightBlue,
//         ),
//         Spacer(
//           flex: 1,
//         ),
//         Text(
//           "99",
//           style: TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//         Spacer(
//           flex: 5,
//         ),
//         Icon(
//           Icons.comment,
//           size: 18,
//           color: Colors.lightBlue,
//         ),
//         Spacer(
//           flex: 1,
//         ),
//         Text(
//           "989",
//           style: TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//         Spacer(
//           flex: 10,
//         ),
//       ],
//     )
//   ],
// ),
// ),
