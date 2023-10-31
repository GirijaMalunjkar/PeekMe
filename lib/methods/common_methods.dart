import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CommonMethods {
  checkConnectivity(BuildContext context) async {
    var connectionResult = await newMethod().checkConnectivity();
    if (connectionResult != ConnectivityResult.mobile &&
        connectionResult != ConnectivityResult.wifi) {
      if (!context.mounted) return;
      displaySnackBar(
          "Your Internate is not Available, Check your Connection. Try Again.",
          context);
    }
  }

  Connectivity newMethod() => Connectivity();

  displaySnackBar(String messageText, BuildContext context) {
    var snackBar = SnackBar(content: Text(messageText));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
