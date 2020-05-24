import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:simple_permissions/simple_permissions.dart';

class topbar extends StatefulWidget {

  @override
  _topbarState createState() => _topbarState();
}

class _topbarState extends State<topbar> {
  @override
  String _platform;
  Permission permission;
  var tempname="Username";
  var tempstatus="Status";

  var img;
  Future getImage() async {
    print("i m");
    await SimplePermissions.requestPermission(Permission.ReadExternalStorage);
      var image = await ImagePicker.pickImage(source: ImageSource.gallery,);
      print("we got ut");
      setState(() {
        img=FileImage(image);
        print(img.runtimeType);
      });

  }
  Future getCameraImage() async {
    await SimplePermissions.requestPermission(Permission.Camera);
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      img=FileImage(image);
      print(img.runtimeType);
    });
  }
  @override
  Widget build(BuildContext context) {
    var a=MediaQuery.of(context).size.longestSide;
    var b=MediaQuery.of(context).size.shortestSide;
    var bar=a/10.666666677;
    var imagesize=bar/2.7;



    void _settingModalBottomSheet(context){
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc){
            return Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                      title: new Text('Choose Image from Gallery',style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,)),
                      onTap: getImage
                  ),
                  new ListTile(
                    leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                    title: new Text('Choose Image from Camera',style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,)),
                    onTap:
                      getCameraImage

                  ),
                  new ListTile(
                    leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                    title: new Text('Set Default',style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,),),
                    onTap: (){
                      setState(() {
                        img=AssetImage('images/dp.png');
                      });
                      Navigator.of(context).pop();
                    },

                  ),
                ],
              ),
            );
          }
      );
    }
    void _changename(context){
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc){
            return Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                      title: new Text('Change Name',style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,)),
                      onTap: (){
                        createDialog(context,1).then((onValue){
                          setState(() {
                            onValue==null?tempname="Username":tempname=onValue;
                          });
                        });
                      }
                  ),
                  new ListTile(
                      leading: new FaIcon(FontAwesomeIcons.meteor,color: Colors.green,),
                      title: new Text('Change Status',style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,)),
                      onTap: (){
                        createDialog(context,0).then((onValue){
                          setState(() {
                            onValue==null?tempstatus="Username":tempstatus=onValue;
                          });
                        });
                      }
                  ),

                ],
              ),
            );
          }
      );
    }
    return Container(
      height: bar,
      color: Color(0xFF075E54),
      child: Row(
        children: <Widget>[
          Icon(Icons.arrow_back,color: Colors.white,),
          SizedBox(width: b/36,),
          GestureDetector(
            onTap: (){
              _settingModalBottomSheet(context);
            },
            child: CircleAvatar(
              radius: imagesize,
              backgroundImage:img==null?AssetImage('images/dp.png'):img,
            ),
          ),
          SizedBox(width: b/72,),
          GestureDetector(
            onTap: (){
              print('1');
              _changename(context);
            },
            child: Container(
              //    padding: EdgeInsets.all(5),
              alignment: Alignment.bottomLeft,
              width: b/2.4,
              height: bar,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(tempname,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16, ),overflow: TextOverflow.ellipsis,),
                  Text(tempstatus,style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.left,)
                ],
              ),

            ),
          ),
          SizedBox(width: b/36,),
          Icon(Icons.videocam,color: Colors.white,),
          SizedBox(width: b/21,),
          Icon(Icons.phone,color: Colors.white,),
          SizedBox(width: b/21,),
          Icon(Icons.more_vert,color: Colors.white,),
          SizedBox(width: 10,),




        ],
      ),
    );
  }
}

Future <String> createDialog(BuildContext context,name){
  TextEditingController custom=TextEditingController();
  name==1?custom.text='Username':custom.text='Status';
  return showDialog(context: context,builder: (context){
    return AlertDialog(
      backgroundColor: Color(0xFFECE5DD),
      title: Text(name==1?'Enter Name':'Enter Status'),
      content: TextField(

        controller: custom,

      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5,
          child: Text('Save'),
          onPressed: (){
            Navigator.of(context).pop(custom.text.toString());
          },
        ),

      ],
    );
  });
}