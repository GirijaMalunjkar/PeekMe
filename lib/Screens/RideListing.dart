import 'package:flutter/material.dart';
import 'BookARide.dart';

void main() => runApp(RideDetailsScreen());

class Client {
  final String name;
  final String iconUrl;
  final double rating;
  final String timing;
  final String pricing;

  Client({
    required this.name,
    required this.iconUrl,
    required this.rating,
    required this.timing,
    required this.pricing,
  });
}

class RideDetailsScreen extends StatelessWidget {
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
    final List<Client> clients = [
      Client(
          name: 'Client 1',
          iconUrl: 'lib/assets/client1.jpg',
          rating: 4.5,
          timing: '10:00 AM - 11:30 AM',
          pricing: '200'),
      Client(
          name: 'Client 2',
          iconUrl: 'lib/assets/client2.jpg',
          rating: 3.2,
          timing: '11:45 AM - 1:00 PM',
          pricing: '150'),
      // Add more clients as needed
    ];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
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
          SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookRideScreen()),
                );
              },
              child: Container(
                height:
                    600, // Set the height of the container to accommodate the GridView
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: clients.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (BuildContext context, int index) {
                    Client client = clients[index];
                    return Container(
                      height: 100,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100], // Set background color to grey
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Colors.black12), // Set border color to red
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 20.0,
                                backgroundImage: AssetImage(client.iconUrl),
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(client.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors
                                              .grey)), // Set text color to grey
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.star, color: Colors.yellow),
                                      Text('${client.rating}',
                                          style: TextStyle(
                                              color: Colors
                                                  .grey)), // Set text color to grey
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Text('Timing: ${client.timing}',
                              style: TextStyle(
                                  color:
                                      Colors.grey)), // Set text color to grey
                          Spacer(),
                          Text('Price: ₹${client.pricing}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Colors.grey)), // Set text color to grey
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
