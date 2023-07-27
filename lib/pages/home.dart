import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, String>? data; // Use a nullable type here

  @override
  Widget build(BuildContext context) {
    // Check if data is null before accessing its properties
    data = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(
                  Icons.edit_location,
                  size: 14.0,
                ),
                label: Text('Edit Location'),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data?['location'] ?? '', // Access properties safely
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data?['time'] ?? '',
                style: TextStyle(
                  fontSize: 66.0,
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
