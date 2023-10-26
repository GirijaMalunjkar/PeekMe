import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationStep2 extends StatefulWidget {
  final Function onVerificationCompleted;
  final Function onResendOtp;

  RegistrationStep2({required this.onVerificationCompleted, required this.onResendOtp});

  @override
  _RegistrationStep2State createState() => _RegistrationStep2State();
}

class _RegistrationStep2State extends State<RegistrationStep2> {
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  void _verifyOtp() {
    // Implement OTP verification logic
    // Call widget.onVerificationCompleted() if verification is successful
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _mobileController,
            decoration: InputDecoration(labelText: 'Mobile Number'),
          ),
          TextField(
            controller: _otpController,
            decoration: InputDecoration(labelText: 'Enter OTP'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _verifyOtp,
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
