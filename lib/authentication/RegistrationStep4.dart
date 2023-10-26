import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationStep4 extends StatefulWidget {
  final Function onRegistrationCompleted;

  RegistrationStep4({required this.onRegistrationCompleted});

  @override
  _RegistrationStep4State createState() => _RegistrationStep4State();
}

class _RegistrationStep4State extends State<RegistrationStep4> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
          ),
          TextField(
            controller: _confirmPasswordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              suffixIcon: IconButton(
                icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Validate passwords
              if (_passwordController.text == _confirmPasswordController.text) {
                // Passwords match, registration completed
                widget.onRegistrationCompleted();
              } else {
                // Passwords don't match, show error message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Passwords do not match.')));
              }
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
