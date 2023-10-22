import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(25, 118, 210, 1.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'lib/assets/Uber.png',
                height: 150,
                width: 150,
              ),
              SizedBox(height: 24.0),
              Text(
                'Your Ride Awaits!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.0),
              Text(
                style: TextStyle(color: Colors.white),
                'Find a ride anytime, anywhere. Fast, safe, and reliable transportation.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(25, 118, 210, 1.0),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: Colors.white),
                  ),
                ),
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
