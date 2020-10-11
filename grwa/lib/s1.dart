import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  Landing({Key key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      Icon(Icons.circle, size: 80.0,),
                      SizedBox(height: 5.0,),
                      Text(
                        'Nishant',
                        style: TextStyle(color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                      ),
                    ],
                  ),
                  IconButton(
                    iconSize: 40.0,
                    color: Colors.red,
                      icon: Icon(Icons.help),
                      onPressed: () {
                        print('Working');
                      }),
                ],
              ),
            ),
            Container(decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(5),
              right: Radius.circular(5))
            ),
              constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width*1, height: MediaQuery.of(context).size.height*1),
             // color: Colors.amber,
                children: [
                Card(
                  elevation: 10.0,
                  color: Colors.white,
                  child: Column(children: [
                    Icon(Icons.home, size: 50.0,),
                    Text('3 Members'),
                  ],),
                ),
              ],),

            ),
          ],
        ),
      ),
    );
  }
}
