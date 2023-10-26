import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationStep1 extends StatefulWidget {
  final Function onNextPressed;

  RegistrationStep1({required this.onNextPressed});

  @override
  _RegistrationStep1State createState() => _RegistrationStep1State();
}

class _RegistrationStep1State extends State<RegistrationStep1> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Validate inputs if necessary
              widget.onNextPressed();
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
