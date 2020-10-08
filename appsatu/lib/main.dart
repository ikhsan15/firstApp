import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.cyan,
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String studentName, studentID, studyProgramID;
  double studentGPA;

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentID(id) {
    this.studentID = id;
  }

  getStudyProgramID(programID) {
    this.studyProgramID = programID;
  }

  getStudentGPA(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  createData() {
    // print("created");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudent").doc(studentName);

    //create map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };

    documentReference.set(students).whenComplete(() {
      print("$studentName created");
    });
  }

  readData() {
    // print("readed");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudent").doc(studentName);

    documentReference.get().then((bacadata) {
      print(bacadata.data());
    });
  }

  updateData() {
    // print("updated");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudent").doc(studentName);

    //create map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };

    documentReference.update(students).whenComplete(() {
      print("$studentName updated");
    });
  }

  deleteData() {
    // print("deleted");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudent").doc(studentName);

    documentReference.delete().whenComplete(() {
      print("$studentName deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("opps, coba aja terus"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    onChanged: (String name) {
                      getStudentName(name);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Student ID",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    onChanged: (String id) {
                      getStudentID(id);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Study Program ID",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    onChanged: (String programID) {
                      getStudyProgramID(programID);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "GPA",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    onChanged: (String gpa) {
                      getStudentGPA(gpa);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          readData();
                        },
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text("Read"),
                        textColor: Colors.white,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          updateData();
                        },
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text("Update"),
                        textColor: Colors.white,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          deleteData();
                        },
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text("Delete"),
                        textColor: Colors.white,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: [
                      Expanded(
                        child: Text("Name"),
                      ),
                      Expanded(
                        child: Text("Student ID"),
                      ),
                      Expanded(
                        child: Text("Program ID"),
                      ),
                      Expanded(
                        child: Text("GPA"),
                      ),
                    ],
                  ),
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("MyStudent")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data.documents[index];
                          return Row(
                            children: [
                              Expanded(
                                child: Text(documentSnapshot["studentName"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["studentID"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["studyProgramID"]),
                              ),
                              Expanded(
                                child: Text(
                                    documentSnapshot["studentGPA"].toString()),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment(0.9, 1),
              child: RaisedButton(
                onPressed: () {
                  createData();
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("Create"),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
