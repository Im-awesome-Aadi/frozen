import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_permissions/simple_permissions.dart';

void main() => runApp(apps()
);
class apps extends StatefulWidget {
  @override
  _appsState createState() => _appsState();
}

class _appsState extends State<apps> {


  String _platform;
  Permission permission;



  @override

  void initState(){
    print("its me");
    super.initState();
    initplatform();
  }

  initplatform() async{
    String platform;
    try{
      platform=await SimplePermissions.platformVersion;
    }on PlatformException{
      platform="Not found";
    }

    if(!mounted) return;

    setState(() {
      _platform=platform;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HI'),

        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('${_platform}'),
              Divider(height: 100,),
              DropdownButton(
                items: _getDropDownItems(),
                value: permission,
                onChanged: dropdownchanged,
              ),
              RaisedButton(
                onPressed: checkPermission,
                child: Text('Check'),
              ),
              RaisedButton(
                onPressed: requestPermission,
                child: Text('Request'),
              ),
              RaisedButton(
                onPressed: getStatus,
                child: Text('Gt'),
              ),
              RaisedButton(
                onPressed: SimplePermissions.openSettings,
                child: Text('Request'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void dropdownchanged(Permission value) {

    setState(() {
      this.permission=value;
      print("permission");
    });
  }

  void checkPermission()  async{

    bool resilt= await SimplePermissions.checkPermission(permission);
    print(resilt.toString());
  }

  void requestPermission() async {
    var result = await SimplePermissions.requestPermission(Permission.WriteExternalStorage);
    print(result.toString());
  }

  void getStatus() async{
    final result =await SimplePermissions.getPermissionStatus(permission);
    print(result.toString());

  }

  List <DropdownMenuItem<Permission>> _getDropDownItems(){
    List <DropdownMenuItem<Permission>> items= List();
    Permission.values.forEach((permission){
      var item = DropdownMenuItem(
        child: Text(getPermissionString(permission)),value:permission
      );
      items.add(item);
    });
    return items;
  }

}
