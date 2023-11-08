import 'dart:html';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:user_app/authentication/login_screen.dart';
import 'package:user_app/authentication/signup_screen.dart';
import 'package:user_app/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      authDomain: "peek-me.firebaseapp.com",
      databaseURL: "https://peek-me-default-rtdb.firebaseio.com/",
      storageBucket: "peek-me.appspot.com",
      apiKey: "AIzaSyABnBBiDhIHySSNDJmzt_G9735xOvJYSFE",
      appId: "1:674544146349:android:8c5155f523496bd409f324",
      messagingSenderId: "674544146349",
      projectId: "peek-me",
    ),
  );
  // Check if location permission is granted, and request if not.
  Future<void> checkAndRequestLocationPermission() async {
    PermissionStatus status = await Permission.locationWhenInUse.status;

    if (status.isDenied) {
      await Permission.locationWhenInUse.request();
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 3, 108, 6)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
