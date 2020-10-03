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
                            },
                            verificationFailed: (FirebaseAuthException e) {
                              if (e.code == 'invalid-phone-number') {
                                print(
                                    'The provided phone number is not valid.');
                                String text =
                                    'The provided phone number is not valid.';
                                _scaffoldkey.currentState.showSnackBar(snack(text));
                                //Scaffold.of(context).showSnackBar(snack(text));
                              }
                            },
                            codeSent:
                                (String verificationId, int resendToken) async {
                              String code = await enterdialog(context);
                              PhoneAuthCredential phoneAuthCredential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: code);
                              await FirebaseAuth.instance
                                  .signInWithCredential(phoneAuthCredential);
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) async {
                              String code = await enterdialog(context);
                              PhoneAuthCredential phoneAuthCredential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: code);
                              await FirebaseAuth.instance
                                  .signInWithCredential(phoneAuthCredential);
                            });
                        print('OTP REQUESTED');
                      } else {
                        var mysnack = snack('You are not an ${args.toString()}!');
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
