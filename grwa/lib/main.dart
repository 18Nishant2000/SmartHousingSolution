import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'decision.dart' as d2;
import 'login.dart';
import 's1.dart';
//import './chat/home_screen.dart';
import './chat/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => Decision(),
        '/decision' : (context) => d2.Decision(),
        '/signup' : (context) => SignUp(),
        '/login' : (context) => Login(),
        '/home': (context) => Landing(),
        '/chat': (context) => Home(),
      },
    );
  }
}

class Decision extends StatelessWidget {
  const Decision({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.grey[800],
                  size: MediaQuery.of(context).size.height*0.4,
                ),
                SizedBox(height: 30.0,),
                RaisedButton(
                  onPressed: ()=> Navigator.pushNamed(context, '/decision'),
                  child: Center(
                    child: Text('Login'),
                  ),
                  color: Colors.amber,
                ),
                RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  child: Center(
                    child: Text('Sign Up'),
                  ),
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ),

    );
  }
}

