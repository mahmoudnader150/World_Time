import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  late Object data ;
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments;

    print(args);

    return Scaffold(
      body: SafeArea(child: Column(
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
        ],
      )),
    );
  }
}
