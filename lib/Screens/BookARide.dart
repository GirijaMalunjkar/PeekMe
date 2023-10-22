import 'package:flutter/material.dart';
import 'Profile.dart';
import 'BookingPayment.dart';

void main() => runApp(BookRideScreen());

class BookRideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ride Details'),
        ),
        body: RideDetailsForm(),
      ),
    );
  }
}

class RideDetailsForm extends StatefulWidget {
  @override
  _RideDetailsFormState createState() => _RideDetailsFormState();
}

class _RideDetailsFormState extends State<RideDetailsForm> {
  TextEditingController _startLocationController = TextEditingController();
  TextEditingController _endLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Today, ${DateTime.now().toLocal()}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          TextField(
            controller: _startLocationController,
            decoration: InputDecoration(labelText: 'Start Location'),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _endLocationController,
            decoration: InputDecoration(labelText: 'End Location'),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total Price for 1 Passenger:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.attach_money_rounded),
                Text(
                  '500',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text('Client Name'),
                  Spacer(),
                  Icon(Icons.person),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Text('Verified Profile'),
                Spacer(),
                Icon(Icons.verified_user),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Text('Cancel Ride'),
                Spacer(),
                Icon(Icons.cancel),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentScreen()),
              );
            },
            child: Text('Book the Ride'),
          ),
        ],
      ),
    );
  }
}
