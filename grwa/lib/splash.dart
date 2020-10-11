import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
@override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () async{
      await Firebase.initializeApp();
      var user = FirebaseAuth.instance.currentUser;
      if(user != null)
      Navigator.pushNamed(context, '/home');
      else
      Navigator.pushNamed(context, '/lsdecision');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[900],
       body: Container(
         width: MediaQuery.of(context).size.width*1,
         height: MediaQuery.of(context).size.height*1,
         child: Padding(
           padding: const EdgeInsets.all(80.0),
           child: Column(
             mainAxisSize: MainAxisSize.max,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             
             children: [
               Text('WELCOME', style: TextStyle(
                 color: Colors.amber,
                 fontWeight: FontWeight.bold,
               ),),
               SizedBox(height: 20,),
               CircularProgressIndicator(backgroundColor: Colors.grey,),
             ],
           ),
         ),
       ),
    );
  }
}