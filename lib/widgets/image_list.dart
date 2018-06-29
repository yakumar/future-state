import 'package:flutter/material.dart';

import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: images.length,
        itemBuilder: (context, int index){
        
        return buildImage(images[index]);
        

        }
        );
  }


  Widget buildImage(ImageModel image){
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Column(children: <Widget>[
        Padding(padding: EdgeInsets.only(bottom: 8.0), child: Image.network(image.url),),

        Text(image.title),

      ],),
      decoration: BoxDecoration(border: new Border.all(color: Colors.red, width: 2.0)),
    );


  }


}