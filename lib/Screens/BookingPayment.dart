import 'package:flutter/material.dart';

void main() => runApp(PaymentScreen());

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.payment,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Payment Screen Content',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
