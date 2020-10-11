import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'details.dart';

class Landing extends StatefulWidget {
  Landing({Key key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int index = 2;

  _update(int no){
    if(no == 0)
    Navigator.pushNamed(context, '/chat');
    else if(no == 1)
    Navigator.pushNamed(context, '/chat');
    else if(no == 2)
    Navigator.pushNamed(context, '/home');
    else if(no == 3)
    Navigator.pushNamed(context, '/chat');
    else
    Navigator.pushNamed(context, '/chat');
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('NO'),
            textColor: Colors.deepPurpleAccent,
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('YES'),
            textColor: Colors.deepPurpleAccent,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[800],
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white.withOpacity(0.60),
                  selectedFontSize: 14,
                  unselectedFontSize: 14,
                  currentIndex: index,
                  onTap: (value) {
                    setState(() {
                      index = value;
                      _update(index);
                    });                    
                  },
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Group')),
                        BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), title: Text('Vendor')),
                        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
                        BottomNavigationBarItem(icon: Icon(Icons.report_problem), title: Text('Complaint')),
                        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), title: Text('Profile')),
                  ]
        ),
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          color: Colors.grey[900],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Nishant',
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            iconSize: 40.0,
                            color: Colors.red,
                            icon: Icon(Icons.help),
                            onPressed: () {
                              print('Working');
                            }),
                        SizedBox(
                          height: 5.0,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.logout,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              var status = authStatus();
                              if (status == 0) {
                                FirebaseAuth.instance.signOut().then((value) =>
                                    Navigator.pushNamed(
                                        context, '/lsdecision'));
                              } else {
                                print(
                                    'Some error occurs at logout button in s1.dart file');
                              }
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(decoration: BoxDecoration(
              //   color: Colors.amber,
              //   borderRadius: BorderRadius.horizontal(left: Radius.circular(5),
              //   right: Radius.circular(5))
              // ),
              //   constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width*1, height: MediaQuery.of(context).size.height*1),
              //  // color: Colors.amber,
              //     child: [
              //     Card(
              //       elevation: 10.0,
              //       color: Colors.white,
              //       child: Column(children: [
              //         Icon(Icons.home, size: 50.0,),
              //         Text('3 Members'),
              //       ],),
              //     ),working

              //   ],),

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
