import 'package:flutter/material.dart';
import 'Screens/Home.dart';
import 'Screens/BookingPayment.dart';
import 'Screens/Landing.dart';
import 'Screens/Login.dart';
import 'Screens/Profile.dart';
import 'Screens/Registration.dart';
import 'Screens/ReviewRating.dart';
import 'Screens/RideListing.dart';
import 'Screens/BookARide.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber Clone',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(25, 118, 210, 1.0),
      ),
      initialRoute: '/book-ride',
      routes: {
        '/': (context) => HomeScreen(),
        '/landing': (context) => LandingScreen(),
        '/login': (context) => MobileLoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/profile': (context) => UserProfileScreen(),
        '/review': (context) => ReviewScreen(),
        '/ride-details': (context) => RideDetailsScreen(),
        '/payment': (context) => PaymentScreen(),
        '/book-ride': (context) => BookRideScreen(),
      },
    );
  }
}
