import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' show get;

import 'models/image_model.dart';

import 'widgets/image_list.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.lime,
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  int counter = 0;
  List<ImageModel> images = [];


  void fetchImage() async {

    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/${counter}');

    var imageModel = ImageModel.fromJson(json.decode(response.body));

    //print(imageModel.title);
    setState(() {
      images.add(imageModel);
      print(images);
    });






  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(

        title: new Text('My title'),
        backgroundColor: Colors.lime,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        backgroundColor: Theme.of(context).primaryColor,
        child: new Icon(Icons.add),
      ),
      body: ImageList(images),
    );
  }
}
