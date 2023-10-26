import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationStep3 extends StatefulWidget {
  final Function onVerificationCompleted;
  final Function onResendOtp;

  RegistrationStep3({required this.onVerificationCompleted, required this.onResendOtp});

  @override
  _RegistrationStep3State createState() => _RegistrationStep3State();
}

class _RegistrationStep3State extends State<RegistrationStep3> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _emailOtpController = TextEditingController();

  void _verifyEmailOtp() {
    // Implement email OTP verification logic
    // Call widget.onVerificationCompleted() if verification is successful
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email Address'),
          ),
          TextField(
            controller: _emailOtpController,
            decoration: InputDecoration(labelText: 'Enter OTP'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _verifyEmailOtp,
            child: Text('Verify OTP'),
          ),
          TextButton(
            onPressed: widget.onResendOtp,
            child: Text('Resend OTP'),
          ),
        ],
      ),
    );
  }
}
