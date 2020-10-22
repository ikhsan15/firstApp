import 'dart:convert';
// import 'dart:html';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterphpcrud/AddEditPage.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future getData() async {
    var url = 'http://200.10.11.112/php-mysql-flutter-crud/read.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Php Mysql Crud'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditPage(),
            ),
          );
          debugPrint('Clicked FloatingActionButton Button');
        },
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new AddEditPage(
                                list: list,
                                index: index,
                              ),
                            ),
                          );
                          debugPrint('Edit Clicked');
                        },
                        child: Card(
                          child: ListTile(
                            // leading: GestureDetector(
                            //   child: Icon(Icons.edit),
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => AddEditPage(
                            //           list: list,
                            //           index: index,
                            //         ),
                            //       ),
                            //     );
                            //     debugPrint('Edit Clicked');
                            //   },
                            // ),
                            // leading: Text(list[index]['id']),
                            title: Text(list[index]['lastname']),
                            subtitle: Text(list[index]['phone']),
                            trailing: GestureDetector(
                              child: Icon(Icons.delete),
                              onTap: () {
                                setState(() {
                                  var url =
                                      'http://200.10.11.112/php-mysql-flutter-crud/delete.php';
                                  http.post(url, body: {
                                    'id': list[index]['id'],
                                  });
                                });
                                debugPrint('delete Clicked');
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
