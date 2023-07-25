import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {




  void getTime() async {
    // String str = "https://jsonplaceholder.typicode.com/todos/1";
    // final uri = Uri.parse(str);
    // http.Response response = await get(uri);
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);


    // make the request
    String str = "http://worldtimeapi.org/api/timezone/Europe/London";
    final uri = Uri.parse(str);
    http.Response response = await get(uri);
    Map data = jsonDecode(response.body);
     print(data);
    //get properties from data

    var datetime = data['datetime']==null?"NA":data['datetime'];
    var offset = data['utc_offset']==null?"NA":data['utc_offset'].substring(1,3);
    // print(datetime);
     //print(offset);

    // create a date time object
    DateTime now  =DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }
  @override
  void initState() {
    super.initState();
    getTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Text('loading screen')
    );
  }
}




