import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:google_sign_in/google_sign_in.dart';

const bool loggedIn = true;
const String cancelledByUser = 'cancelledByUser';

void main() => runApp(MobileLoginScreen());

class MobileLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mobile Login'),
        ),
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  // Handle phone number input changes
                },
                inputDecoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                selectorTextStyle: TextStyle(color: Colors.black),
                textFieldController: _phoneNumberController,
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                // Set default country to India (IN)
                initialValue: PhoneNumber(isoCode: 'IN'),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     SocialMediaButton('assets/facebook_icon.png', _handleFacebookLogin),
          //     SocialMediaButton('assets/google_icon.png', _handleGoogleLogin),
          //   ],
          // ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                // Perform login logic here with _phoneNumberController.text
                if (_phoneNumberController.text.isNotEmpty) {
                  print('Phone Number: ${_phoneNumberController.text}');
                } else {
                  print('Please enter a phone number.');
                }
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> _handleFacebookLogin() async {
  //   final FacebookLogin facebookLogin = FacebookLogin();
  //   final FacebookLoginResult result = await facebookLogin.logIn(['email']);
  //
  //   switch (result.status) {
  //
  //     case FacebookLoginStatus.loggedIn:
  //       print('Facebook Login Successful. Access Token: ${result.accessToken.token}');
  //       break;
  //     case FacebookLoginStatus.cancelledByUser:
  //       print('Facebook Login Cancelled');
  //       break;
  //     case FacebookLoginStatus.error:
  //       print('Error during Facebook Login: ${result.errorMessage}');
  //       break;
  //   }
  // }
  //
  // Future<void> _handleGoogleLogin() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //     if (googleUser == null) {
  //       print('Google Login Cancelled');
  //       return;
  //     }
  //
  //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     // Use the 'credential' for further Google login logic
  //     print('Google Login Successful. Access Token: ${googleAuth.accessToken}, ID Token: ${googleAuth.idToken}');
  //   } catch (error) {
  //     print('Error during Google Login: $error');
  //   }
  // }
}

class SocialMediaButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;

  SocialMediaButton(this.iconPath, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Image.asset(
        iconPath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
