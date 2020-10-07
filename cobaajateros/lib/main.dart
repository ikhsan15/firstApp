// import 'package:cobaajateros/views/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LitAuthInit(
      authProviders: AuthProviders(
        emailAndPassword: true,
        anonymous: true,
        google: true,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'material app',
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Scaffold(
          appBar: AppBar(
            title: Text('sanApp'),
          ),
          body: Center(
            child: ListView(
              children: [
                LitAuthState(
                  authenticated: Home(),
                  unauthenticated: LitAuth(
                    config: AuthConfig(
                      title: Text(
                        'my sign in form',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),
                      // emailTextField: InputDecoration(labelText: 'my email'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return MaterialApp(
    //   home: LoginPage(),
    // );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('well done!!'),
          RaisedButton(
            onPressed: () {
              context.signOut();
            },
            child: Text('sign out'),
          )
        ],
      ),
    );
  }
}
