import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location = "NA";  //location name for UI
  String time = "NA"; // time in that location
  String flag = "NA"; //url to an asset flag icon
  String url ="NA";
  bool isDayTime = false;




  WorldTime(String location,String flag,String url){
    this.location = location;
    this.flag = flag;
    this.url = url;
  }

  Future<void> getTime() async {
    // String str = "https://jsonplaceholder.typicode.com/todos/1";
    // final uri = Uri.parse(str);
    // http.Response response = await get(uri);
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);

    try {
      // make the request
      String str = "http://worldtimeapi.org/api/timezone/$url";
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


      //set time property
      isDayTime = (now.hour >6 && now.hour<20)?true:false;
      time = DateFormat.jm().format(now);
    }catch(e){
       print('caught error: $e');
       time = "could not get time data";
    }


  }
}

WorldTime instance = WorldTime('Berlin', 'germany.png','Europe/Berlin');



