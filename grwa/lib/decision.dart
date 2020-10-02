import 'package:flutter/material.dart';

class Decision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              elevation: 10.0,
              splashColor: Colors.blue,
              color: Colors.amber,
              onPressed: () => Navigator.pushNamed(context, '/l'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.admin_panel_settings_rounded,
                    size: MediaQuery.of(context).size.width * .38,
                  ),
                  Text(
                    'ADMIN',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            RaisedButton(
              elevation: 10.0,
              splashColor: Colors.blue,
              color: Colors.amber,
              onPressed: () => Navigator.pushNamed(context, '/l'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.supervised_user_circle_rounded,
                    size: MediaQuery.of(context).size.width * .38,
                  ),
                  Text(
                    'USER',
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
    );
  }
}
