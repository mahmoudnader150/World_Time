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




  void getData() async {
    String str = "https://jsonplaceholder.typicode.com/todos/1";
    final uri = Uri.parse(str);
    http.Response response = await get(uri);
    Map data = jsonDecode(response.body);
    print(data);

  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Text('loading screen')
    );
  }
}




