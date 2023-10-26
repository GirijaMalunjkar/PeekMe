import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Screens/Home.dart';
import 'Screens/BookingPayment.dart';
import 'Screens/Landing.dart';
import 'Screens/Login.dart';
import 'Screens/Profile.dart';
import 'authentication/RegistrationStep1.dart';
import 'Screens/ReviewRating.dart';
import 'Screens/RideListing.dart';
import 'Screens/BookARide.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAa9PEhTSXPv-_z-pZwO5Vu1L5QRaE54Ug',
      authDomain: 'peekme.com',
      databaseURL:
      'https://peekme-2101e-default-rtdb.firebaseio.com/',
      projectId: 'peekme-2101e',
      storageBucket: 'peekme-2101e.appspot.com',
      messagingSenderId: '',
      appId: '1:353321202958:android:e6af657cedc9709111935f',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber Clone',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(25, 118, 210, 1.0),
      ),
      initialRoute: '/registration',
      routes: {
        '/': (context) => HomeScreen(),
        '/landing': (context) => LandingScreen(),
        '/login': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/profile': (context) => UserProfileScreen(),
        '/review': (context) => ReviewScreen(),
        '/ride-details': (context) => RideDetailsScreen(),
        '/payment': (context) => PaymentScreen(),
        '/book-ride': (context) => BookRideScreen(),
        },
    );
  }
}
