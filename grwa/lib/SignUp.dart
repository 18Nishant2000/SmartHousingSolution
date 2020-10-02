import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grwa/components.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  String name, age, hno, mobno, nomem, email, password;

  check() {
    //var f = 0;
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) => value.docs.forEach((element) {
          //print(element.id.toString());
              if (element.id == hno) {
                return 0;
              }
            }));
            //if(f==1) return 1;
    return 1;
  }

  register() {
    var resp = FirebaseFirestore.instance.collection('users').doc(hno).set({
      'Name': name,
      'Age': age,
      'House_No': hno,
      'Mobile_No': mobno,
      'No_Of_Members': nomem,
      'Email': email,
      'Password': password,
    });
    if (resp.toString().isNotEmpty) return 0;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'REGISTRATION',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) => value.isEmpty ? 'Required' : null,
                    style: TextStyle(
                      color: Colors.grey[350],
                    ),
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
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
                        age = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Age',
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
                  TextFormField(
                    validator: (value) => value.isEmpty ? 'Required' : null,
                    style: TextStyle(
                      color: Colors.grey[350],
                    ),
                    onChanged: (val) {
                      setState(() {
                        nomem = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'No of members',
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
                        email = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[50],
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) => value.isEmpty ? 'Required' : null,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.grey[350],
                    ),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[50],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        await Firebase.initializeApp();
                        var res = check();
                        if (res == 0) {
                          var mysnack = snack('Already Registered!');
                          Scaffold.of(context).showSnackBar(mysnack);
                          Future.delayed(Duration(seconds: 5),
                              () => Navigator.pushNamed(context, '/decision'));
                        } else {
                          var res = register();
                          if (res == 0) {
                            var mysnack = snack('Registered Successfully!');
                            Scaffold.of(context).showSnackBar(mysnack);
                            Future.delayed(Duration(seconds: 5),
                                () => Navigator.pushNamed(context, '/decision'));
                          } else {
                            var mysnack = snack('Something went wrong!!!\nPlease try again');
                            Scaffold.of(context).showSnackBar(mysnack);

                          }
                        }
                      }                     
                    },
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
