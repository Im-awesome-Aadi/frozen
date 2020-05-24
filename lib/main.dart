import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'package:frozen/welcomescreen.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
void main() => runApp(MyApp()
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void initState(){
    super.initState();
    method();
  }

  void method() async{
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    final Directory _appDocDirFolder = Directory('${_appDocDir.path}/FrozenApp}/');
    if(await _appDocDirFolder.exists())
    { return print('hi'); }
    else{
      final Directory _appDocDirNewFolder=await _appDocDirFolder.create(recursive: true);
      print( _appDocDirNewFolder.path);
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcome(),
    );
  }
}


