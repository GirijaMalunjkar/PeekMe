import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/authentication/Registration2.dart';

class RegistrationPage1 extends StatefulWidget {
  @override
  _RegistrationPage1State createState() => _RegistrationPage1State();
}

class _RegistrationPage1State extends State<RegistrationPage1> {
  final TextEditingController _mobileController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;

  Future<void> _verifyPhoneNumber(BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+1${_mobileController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential authResult = await _auth.signInWithCredential(credential);
        // Handle authenticated user (if needed) and navigate to the next screen
        print('User authenticated: ${authResult.user!.uid}');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationPage2()));
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Error during phone number verification: ${e.message}');
        // Handle verification failed, e.g., show an error message to the user
      },
      codeSent: (String verificationId, int? resendToken) {
        print('Code sent to $_mobileController.text');
        _verificationId = verificationId;
        // Navigate to the OTP verification screen
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen(_verificationId)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('Timeout: $verificationId');
        // Handle timeout or show a resend button to the user
      },
      timeout: Duration(seconds: 60), // Set a timeout for the verification process
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _mobileController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Mobile Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _verifyPhoneNumber(context),
              child: Text('Get OTP'),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpVerificationScreen extends StatefulWidget {
  final String verificationId;

  OtpVerificationScreen(this.verificationId);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _codeResent = false;

  Future<void> _signInWithPhoneNumber(String verificationId, String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      // Handle authenticated user (if needed) and navigate to the next screen
      print('User authenticated: ${authResult.user!.uid}');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationPage2()));
    } catch (e) {
      print('Error during OTP verification: $e');
      // Handle verification errors, e.g., show an error message to the user
    }
  }

  Future<void> _resendOtp(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ... (same code as before for automatic verification)
        },
        verificationFailed: (FirebaseAuthException e) {
          // ... (same code as before for verification failure)
        },
        codeSent: (String verificationId, int? resendToken) {
          // Code sent callback (same as before)
          print('Code resent to $phoneNumber');
          setState(() {
            _codeResent = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // ... (same code as before for timeout)
        },
        timeout: Duration(seconds: 60),
      );
    } catch (e) {
      print('Error resending OTP: $e');
      // Handle errors if the resend fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter OTP'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _signInWithPhoneNumber(widget.verificationId, _otpController.text),
              child: Text('Verify OTP'),
            ),
            SizedBox(height: 20),
            _codeResent
                ? Text(
              'OTP Resent!',
              style: TextStyle(color: Colors.green),
            )
                : ElevatedButton(
              onPressed: () => _resendOtp('+1YOUR_PHONE_NUMBER'),
              child: Text('Resend OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
