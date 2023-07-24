import 'package:flutter/material.dart';



class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

   void getData() async{
     // simulate netwrok request for a username
     String username = await Future.delayed(Duration(seconds: 3),(){
       return 'Mahmoud';
     });

     // simulate netwrok request to get bio for username
     String bio = await Future.delayed(Duration(seconds: 2),(){
      return "sw engineer";
     });



     print("$username - $bio");
   }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter+=1;
          });
        },
        child: Text("counter is : $counter"),
      ),
    );
  }
}
