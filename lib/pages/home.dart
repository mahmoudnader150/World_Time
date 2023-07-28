import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic>? data; // Use a nullable type here

  @override
  Widget build(BuildContext context) {
    // Check if data is null before accessing its properties
    data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    print(data);

    //set background
    String bgImage = data?['isDayTime']? 'day.jpg':'night.jpg';
    Color bgColor  = data?['isDayTime']? Colors.lightBlueAccent : Colors.blueAccent;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
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
                    color: Colors.grey[300],
                    size: 14.0,
                  ),
                  label: Text(
                      'Edit Location',
                       style: TextStyle(
                           color : Colors.grey[300]
                       ),

                  ),
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
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data?['time'] ?? '',
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
