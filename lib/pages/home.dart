import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //inside the build method we receive the actual argument

    data = ModalRoute.of(context).settings.arguments;

    print(data);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
