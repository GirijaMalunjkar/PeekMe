import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// void main() => runApp(LoginPage());
//
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginPage(),
//     );
//   }
// }

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      // Navigate to home page or desired screen
    } catch (e) {
      print(e.toString());
      // Handle Google sign-in error
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final AuthCredential credential = FacebookAuthProvider.credential(accessToken.token);

        await _auth.signInWithCredential(credential);
        // Navigate to home page or desired screen
      } else {
        // Handle Facebook sign-in error
      }
    } catch (e) {
      print(e.toString());
      // Handle Facebook sign-in error
    }
  }

  Future<void> _signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Navigate to home page or desired screen
    } catch (e) {
      print(e.toString());
      // Handle email/password sign-in error
    }
  }

  Future<void> _verifyPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          // Navigate to home page or desired screen
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          // Handle verification failure
        },
        codeSent: (String verificationId, int? resendToken) {
          // Navigate to OTP verification page and pass verificationId
          // Use verificationId to create PhoneAuthCredential
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto retrieval timeout
        },
      );
    } catch (e) {
      print(e.toString());
      // Handle phone number verification error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _signInWithGoogle,
              child: Text('Login with Google'),
            ),
            ElevatedButton(
              onPressed: _signInWithFacebook,
              child: Text('Login with Facebook'),
            ),
            ElevatedButton(
              onPressed: () {
                _verifyPhoneNumber('+1234567890');
              },
              child: Text('Login with Phone Number'),
            ),
            ElevatedButton(
              onPressed: () {
                _signInWithEmailAndPassword('test@example.com', 'password123');
              },
              child: Text('Login with Email/Password'),
            ),
          ],
        ),
      ),
    );
  }
}
