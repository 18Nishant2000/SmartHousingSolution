import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'components.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  String mobno, hno;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.grey[900],
      body: Container(
        margin: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WELCOME',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) => value.isEmpty ? 'Required' : null,
                  style: TextStyle(
                    color: Colors.grey[350],
                  ),
                  onChanged: (val) {
                    setState(() {
                      hno = val;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'House No',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[50],
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) => value.isEmpty ? 'Required' : null,
                  style: TextStyle(
                    color: Colors.grey[350],
                  ),
                  onChanged: (val) {
                    setState(() {
                      mobno = val;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Mobile No',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[50],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  elevation: 10.0,
                  splashColor: Colors.blue,
                  color: Colors.amber,
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      //Future.delayed(Duration(seconds: 3), () => enterdialog(context));
                      await Firebase.initializeApp();
                      var res = await check(args.toString(), hno);
                      if (res == true) {
                        print('USER EXISTS');
                        await FirebaseAuth.instance.verifyPhoneNumber(
                            timeout: Duration(seconds: 30),
                            phoneNumber: '+91' + mobno,
                            verificationCompleted:
                                (PhoneAuthCredential credential) async {
                              await FirebaseAuth.instance
                                  .signInWithCredential(credential);
                              Navigator.pushNamed(context, '/home');
                            },
                            verificationFailed: (FirebaseAuthException e) {
                              String text;
                              if (e.code == 'invalid-phone-number') {
                                text =
                                    'The provided phone number is not valid.';
                              } else {
                                text = 'Wrong OTP entered!!';
                              }
                              _scaffoldkey.currentState
                                  .showSnackBar(snack(text));
                            },
                            codeSent:
                                (String verificationId, int resendToken) async {
                              String code = await enterdialog(context);
                              PhoneAuthCredential phoneAuthCredential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: code);
                              if (code == phoneAuthCredential.smsCode) {
                                await FirebaseAuth.instance
                                    .signInWithCredential(phoneAuthCredential);
                                Navigator.pushNamed(context, '/home');
                              } else {
                                _scaffoldkey.currentState.showSnackBar(
                                    snack('Wrong OTP entered!!!'));
                                Future.delayed(
                                    Duration(seconds: 5),
                                    () => Navigator.pushNamed(
                                        context, '/decision'));
                              }
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) async {
                              String code = await enterdialog(context);
                              PhoneAuthCredential phoneAuthCredential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: code);
                               if (code == phoneAuthCredential.smsCode) {
                                await FirebaseAuth.instance
                                    .signInWithCredential(phoneAuthCredential);
                                Navigator.pushNamed(context, '/home');
                              } else {
                                _scaffoldkey.currentState.showSnackBar(
                                    snack('Wrong OTP entered!!!'));
                                Future.delayed(
                                    Duration(seconds: 5),
                                    () => Navigator.pushNamed(
                                        context, '/decision'));
                              }
                            });
                        print(res);
                        print('OTP REQUESTED');
                      } else {
                        var mysnack =
                            snack('You are not an ${args.toString()}!');
                        _scaffoldkey.currentState.showSnackBar(mysnack);
                        //Scaffold.of(context).showSnackBar(mysnack);
                        print('Not an ${args.toString()}!');
                      }
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'GET OTP',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
