import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io' as Io;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
class preview extends StatelessWidget {

  final  photo;
  preview({this.photo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.green,
          title: Center(child: Text('PREVIEW IMAGE')),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () async{
                print("hello");
                final Io.Directory _appDocDir = await getApplicationDocumentsDirectory();
                final Io.Directory _appDocDirFolder = Io.Directory('${_appDocDir.path}/FrozenApp}/');

                Io.File("$_appDocDirFolder/image_1.jpg")
                  ..writeAsBytesSync(photo.encodeJpg( quality: 95));
              },
            )
          ],
        ),

      body: Column(
        children: <Widget>[
          Card(
          elevation: 10,

            margin: EdgeInsets.all(15),
           child: Image(
    image: FileImage(photo),
    ),
           // height: MediaQuery.of(context).size.height,
             // width: MediaQuery.of(context).size.width,
     /* decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
              image: photo

            )
          ),*/
          ),

        ],
      ),
    );
  }
}
