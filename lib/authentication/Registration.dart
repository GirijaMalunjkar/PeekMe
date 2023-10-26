import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MaterialApp(home: RegistrationPage()));

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          RegistrationStep1(onNextPressed: () {
            _pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          }),
          RegistrationStep2(onVerificationCompleted: () {
            _pageController.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          }),
          OtpVerificationScreen(onResendOtp: () {
            _pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          }),
          RegistrationEmailPasswordStep(onRegistrationCompleted: () {
            // Handle email and password registration completion, e.g., navigate to the home screen
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }),
        ],
      ),
    );
  }
}

class RegistrationStep1 extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final Function onNextPressed;

  RegistrationStep1({required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
              // Handle step 1 registration logic
              onNextPressed();
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

class RegistrationStep2 extends StatelessWidget {
  final Function onVerificationCompleted;

  RegistrationStep2({required this.onVerificationCompleted});

  final TextEditingController _mobileController = TextEditingController();

  Future<void> _verifyPhoneNumber(BuildContext context) async {
    // Implement phone number verification logic here
    // When verification is completed, call onVerificationCompleted
    onVerificationCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class OtpVerificationScreen extends StatelessWidget {
  final Function onResendOtp;

  OtpVerificationScreen({required this.onResendOtp});

  final TextEditingController _otpController = TextEditingController();
  bool _codeResent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onPressed: () {
              // Handle OTP verification logic here
            },
            child: Text('Verify OTP'),
          ),
          SizedBox(height: 20),
          _codeResent
              ? Text(
            'OTP Resent!',
            style: TextStyle(color: Colors.green),
          )
              : ElevatedButton(
            onPressed: () {
              // Handle OTP resend logic here
              onResendOtp();
            },
            child: Text('Resend OTP'),
          ),
        ],
      ),
    );
  }
}

class RegistrationEmailPasswordStep extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Function onRegistrationCompleted;

  RegistrationEmailPasswordStep({required this.onRegistrationCompleted});

  Future<void> _register(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Store additional user information in Firebase Firestore if needed
      // ...

      // Notify the parent widget that registration is completed
      onRegistrationCompleted();

      // You can also navigate to the next step or screen if needed
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
    } catch (e) {
      print('Error during registration: $e');
      // Handle registration errors, e.g., show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _register(context),
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
