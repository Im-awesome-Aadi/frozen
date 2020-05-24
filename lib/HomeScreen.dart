import 'package:frozen/photo.dart';
import 'package:frozen/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'adding.dart';
import 'package:frozen/selecticon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:frozen/preview.dart';
import 'package:frozen/animation.dart';
import 'package:permission_handler/permission_handler.dart';
class HomeScreen extends StatefulWidget {
  @override

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Offset _offset = Offset(0, 0);
  //Create an instance of ScreenshotController
   ScreenshotController screenshotController = ScreenshotController();
  TimeOfDay timess;
   void initState(){
    super.initState();
    timess = TimeOfDay.now();
    print("Home is called");
  }
  final _controller = ScrollController();
  var img;
  List s=[1];
  List div=[];
  var name="Username";
  var status = "status";
  List abc=[
    SizedBox(height: 10,),];
  List msg=[];
  List time=[];
  List type=[];
  List ismsgdel=[];
  List images=[];
  var keyboard="Type a message";

  Future <void> _cap(my)async{
    try{
      RenderRepaintBoundary bb=my.currentContext.findRenderObject();
      ui.Image image=await bb.toImage();
      ByteData bytes=await image.toByteData(format: ui.ImageByteFormat.png);
      var png=bytes.buffer.asUint8List();
      Navigator.of(context).push(
          MaterialPageRoute(
              builder:(_)=> new preview(photo: png,)
          )
      );
    }catch(e){
      print(e);
    }
  }

  Widget build(BuildContext context) {

    var a=MediaQuery.of(context).size.longestSide;
    var b=MediaQuery.of(context).size.shortestSide;

    _addPhoto(BuildContext context){
      TextEditingController custom=TextEditingController();
      TextEditingController custom1=TextEditingController();
      TextEditingController custom2=TextEditingController();
      return showDialog(context: context,builder: (context){
        return  photo(abc: abc,long: a,short: b,custom: custom,custom1: custom1,custom2:custom2,msg: msg,time: time,type: type,ismsgdel: ismsgdel,images:images,div: div,);

      });
    }
    _addSendText(BuildContext context){
      TextEditingController custom=TextEditingController();
      TextEditingController custom1=TextEditingController();
      TextEditingController custom2=TextEditingController();
      return showDialog(context: context,builder: (context){
        return  adds(abc: abc,long: a,short: b,custom: custom,custom1: custom1,custom2:custom2,msg: msg,time: time,type: type,ismsgdel: ismsgdel,images:images,div: div,);
      });
    }
    _changes(BuildContext context,index){
      TextEditingController custom=TextEditingController();
      TextEditingController custom1=TextEditingController();
      TextEditingController custom2=TextEditingController();
      custom.text=msg[index-1];
      custom1.text=time[index-1].toString().substring(0,2);
      custom2.text=time[index-1].toString().substring(2,4);
      return showDialog(context: context,builder: (context){
        return  div[index-1]==0?AlertDialog(
          backgroundColor: Color(0xFFECE5DD),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: a/64,),
                ismsgdel[index-1]==1?SizedBox.shrink():
                TextField(
                    controller: custom,
                    maxLines: 4,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelText: 'Edit Message'
                    )

                ),
                SizedBox(height: a/64,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                          maxLength: 2,
                          controller: custom1,
                          decoration: InputDecoration(
                              labelText: 'Edit Hour'
                          )
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Flexible(
                      child: TextField(
                        maxLength: 2,
                          controller: custom2,
                          decoration: InputDecoration(

                              labelText: 'Edit Minute'
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: a/64,),
                type[index-1]==2?select(ismsgdel: ismsgdel,index: index,s: s,):SizedBox.shrink(),
                FlatButton(
                  onPressed: (){
                    print(custom.text);
                    abc.removeAt(index);

                    images[index-1]==null?abc.insert(index,
                        Row(
                      mainAxisAlignment: type[index-1]==1?MainAxisAlignment.start:MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //height: 170,
                      //width: 10,
                      //color: Colors.blue,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints:BoxConstraints(maxWidth: b/1.44),
                          child: Container(

                            margin:EdgeInsets.symmetric(vertical: a/640,horizontal: b/360),
                            padding:EdgeInsets.symmetric(vertical: a/128,horizontal: b/72),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[

                                Container(
                                  child: Wrap(
                                    children: <Widget>[
                                      ismsgdel[index-1]==0?SizedBox.shrink():Icon(Icons.do_not_disturb,color: Colors.grey,size: a/40,),
                                      RichText(
                                        text: TextSpan(
                                            text: '${custom.text}      ',
                                            style: TextStyle(color: ismsgdel[index-1]==1?Colors.grey:Colors.black,fontSize: a/42.5,fontStyle: ismsgdel[index-1]==1?FontStyle.italic:FontStyle.normal),
                                            children: <TextSpan>[
                                            ]
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  child: Wrap(
                                    children: <Widget>[
                                      Text('${custom1.text + ':' + custom2.text}',style: TextStyle(color: Colors.grey,fontSize: a/64,),textAlign: TextAlign.right,),
                                      SizedBox(width: b/90,),
                                      type[index-1]==2?ismsgdel[index-1]==1?SizedBox.shrink():Container(
                                        margin: EdgeInsets.only(top: a/128),
                                        width: b/24,
                                        child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Icon(
                                              s[0]<=2?Icons.done_all:s[0]==3?Icons.done:Icons.alarm

                                              ,size: a/42.5,
                                              color: s[0]==1?Colors.blue:Colors.grey,)),
                                      ):SizedBox.shrink()

                                    ],
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: type[index-1]==1?Colors.white:Color(0xFFE4FDC6),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                          ),
                        ),


                      ],
                    )):
                    abc.insert(index, Row(
                      mainAxisAlignment: type[index-1]==1?MainAxisAlignment.start:MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          decoration:BoxDecoration(
                              color:type[index-1]==1?Colors.white:Color(0xFFE4FDC6),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)
                              )
                          ),
                          margin: EdgeInsets.all(1),

                          child:ConstrainedBox(

                              constraints: BoxConstraints(maxWidth: b/1.8,),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration:BoxDecoration(
                                    color:type[index-1]==1?Colors.white:Color(0xFFE4FDC6),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)
                                    )
                                ),
                                child: Column(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                                    children: <Widget>[
                                      Container(
                                        height: 200,
                                        decoration:BoxDecoration(
                                            color:type[index-1]==1?Colors.white:Color(0xFFE4FDC6),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)
                                            )
                                        ),
                                        child: ConstrainedBox(

                                          constraints: BoxConstraints(maxWidth: a/1.8,maxHeight: b/1.8),
                                          child: Center(child: Image(image:images[index-1],)),
                                        ),
                                      ),
                                      Container(

                                        decoration:BoxDecoration(
                                            color:type[index-1]==1?Colors.white:Color(0xFFE4FDC6),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)
                                            )
                                        ),
                                        child: ConstrainedBox(

                                          constraints: BoxConstraints(maxWidth: b/1.8),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('${custom.text}')),
                                        ),
                                      ),
                                      Container(

                                        decoration:BoxDecoration(
                                            color:type[index-1]==1?Colors.white:Color(0xFFE4FDC6),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)
                                            )
                                        ),
                                        child: ConstrainedBox(

                                          constraints: BoxConstraints(maxWidth: b/1.8),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                                Text('${custom1.text + ':' +custom2.text}',style: TextStyle(fontSize: 10,color: Colors.grey),),
                                                type[index-1]==2?Container(
                                                  margin: EdgeInsets.only(top: a/128),
                                                  width: b/24,
                                                  child: Align(
                                                      alignment: Alignment.bottomRight,
                                                      child: Icon(
                                                        s[0]<=2?Icons.done_all:s[0]==3?Icons.done:Icons.alarm

                                                        ,size: a/42.5,
                                                        color: s[0]==1?Colors.blue:Colors.grey,)),
                                                ):SizedBox.shrink()
                                              ],
                                            ),
                                          ),
                                        ),

                                      ),
                                    ]
                                ),
                              )
                          ),
                        )
                      ],

                    ));
                    setState(() {
                      msg[index-1]=custom.text;
                      time[index-1]=custom1.text+custom2.text;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: a/12.8,
                    width: double.infinity,
                    //color: Colors.green,
                    child: Card(
                        color: Colors.green,
                        child: Center(child: Text('Click to Change Chat',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),))),
                  ),
                )
              ],
            ),
          ),
        ):


        AlertDialog(
          backgroundColor: Color(0xFFECE5DD),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: a/128,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: a/64,horizontal: b/36),

                  child: TextField(
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    controller: custom,
                    decoration: InputDecoration(
                        hintText: 'Add Divider (eg. Today, Yesterday etc)'
                    ),

                  ),
                ),
                SizedBox(height: a/128,),
                FlatButton(
                  onPressed: (){
                    if(custom.text.isEmpty){
                      print('spr');
                    }
                    else{
                      setState(() {
                        abc.removeAt(index);
                        abc.insert(index,
                            Center(

                              child: Card(
                                color: Color(0xFFE0F3FA),
                                child: Container(

                                    margin: EdgeInsets.symmetric(vertical: a/80,horizontal: b/45),
                                    child: Text(custom.text.toUpperCase())),
                              ),
                            )
                        );
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                    height: a/12.8,
                    width: double.infinity,
                    //color: Colors.green,
                    child: Card(
                        color: Colors.green,
                        child: Center(child: Text('Add Text',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),))),
                  ),
                )
              ],
            ),
          ),
        );

      });
    }
    _addDivider(BuildContext context){
      TextEditingController custom=TextEditingController();
      return showDialog(context: context,builder: (context){
        return  AlertDialog(
          backgroundColor: Color(0xFFECE5DD),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: a/128,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: a/64,horizontal: b/36),

                  child: TextField(
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    controller: custom,
                    decoration: InputDecoration(
                        hintText: 'Add Divider (eg. Today, Yesterday etc)'
                    ),

                  ),
                ),
                SizedBox(height: a/128,),
                FlatButton(
                  onPressed: (){
                    if(custom.text.isEmpty){
                      print('spr');
                    }
                    else{
                      setState(() {
                        div.add(1);
                        msg.add(
                            null
                        );
                        time.add(
                            null
                        );

                        type.add(
                            null
                        );
                        ismsgdel.add(
                            null
                        );
                        images.add(
                            null
                        );
                        print(div);
                        abc.add(
                            Center(

                              child: Card(
                                color: Color(0xFFE0F3FA),
                                child: Container(

                                    margin: EdgeInsets.symmetric(vertical: a/80,horizontal: b/45),
                                    child: Text(custom.text.toUpperCase())),
                              ),
                            )
                        );
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                    height: a/12.8,
                    width: double.infinity,
                    //color: Colors.green,
                    child: Card(
                        color: Colors.green,
                        child: Center(child: Text('Add Text',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),))),
                  ),
                )
              ],
            ),
          ),
        );

      });
    }
    void _addToChat(context){
      showModalBottomSheet(

          context: context,
          builder: (BuildContext bc){
            return Container(
              child: new Wrap(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.green,
                    child: Center(child: Text('ADD CHATS',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontFamily: 'BalsamiqSans',letterSpacing: 1.3),),),
                  ),
                  //,style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,)
                  new ListTile(
                      leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                      title: new Text('Add Text',style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,)),
                      onTap: (){
                        _addSendText(context);
                      }
                  ),
                  new ListTile(
                    leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                    title: new Text('Add Photo',style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,)),
                    onTap: (){
                      _addPhoto(context);

                    },
                  ),
                  ListTile(
                    leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                    title: Text('Add Divider',style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,)),
                    onTap: (){
                      _addDivider(context);
                    },
                  ),
                ],
              ),
            );
          }
      );
    }
    void _editChat(context,index){

      showModalBottomSheet(

          context: context,
          builder: (BuildContext bc){
            return Container(
              child: new Wrap(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.green,
                    child: Center(child: Text('EDIT CHATS',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),),
                  ),
                  new ListTile(
                      leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                      title: new Text('Remove Chat',style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,)),
                      onTap: (){
                        setState(() {
                          abc.removeAt(index);

                          msg.removeAt(index-1);
                          type.removeAt(index-1);
                          time.removeAt(index-1);
                          ismsgdel.removeAt(index-1);
                          images.removeAt(index-1);
                          div.removeAt(index-1);
                        });
                        Navigator.of(context).pop();
                      }
                  ),
                  new ListTile(
                    leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                    title: new Text('Edit Chat',style: TextStyle(fontFamily: 'BalsamiqSans',letterSpacing: 1.2,)),
                    onTap: (){
                      _changes(context, index);

                    },
                  ),

                ],
              ),
            );
          }
      );
    }
    print("widget is build");
    setState(() {
      abc=abc;
    });
    return  SafeArea(
      child: Scaffold(

        bottomNavigationBar: new BottomAppBar(

          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,

          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                  color: Colors.green,
                  onPressed: (){

                    Navigator.of(context).pop();
                  },
                  child: Text('BACK',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.5))
              ),

          //  Spacer(),
              RaisedButton(
                color: Colors.green,
                onPressed: (){


                  var _imageFile = null;
                  screenshotController.capture(
                      pixelRatio: 3,
                      delay: Duration(milliseconds: 10))
                      .then((File image) async {
                    //print("Capture Done");
                    setState(() {

                      /*_imageFile=FileImage(_imageFile);
              print(_imageFile.runtimeType);*/
                    });
                    Navigator.push(
                        context,
                        animation(widget: preview(photo: image,))
                    );



                  });
                },
                child: Text('CONFIRM',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.5),)
              )
            ],
          ),
        ),


        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFFECE5DD),

        body: Stack(
          children: <Widget>[
            Screenshot(
              controller: screenshotController,
              child: Stack(
                children: <Widget>[
                  Container(
                    color:Color(0xFFECE5DD) ,
                    height: double.infinity,
                    // color: Colors.red,
                    child: Column(

                      children: <Widget>[

                        topbar(),

                        ConstrainedBox(

                          constraints: BoxConstraints(maxHeight: a/1.4234),

                          child: ListView.builder(
                              controller: _controller,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              itemCount: abc.length,

                              itemBuilder: (context,index){
                                return  GestureDetector(
                                  onTap: (){

                                    _editChat(context, index);
                                    print(msg[index-1]);
                                    print(time[index-1]);
                                    print(div[index-1]);

                                  },
                                  child: abc[index],
                                );
                              }),
                        ),



                      ],
                    ),
                  ),
                  Container(

                    margin: EdgeInsets.only(top: (a/1.254901)),
//              height: 80,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(
                                    Icons.tag_faces,
                                    color: Colors.grey[500],
                                    size: 30,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      createDialog(context).then((onValue){
                                        setState(() {
                                          onValue==null?keyboard=keyboard:keyboard=onValue;
                                        });
                                      });
                                    },
                                    child: Container(

                                      height: a/16,
                                      width: b/2,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "$keyboard",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.attach_file,
                                    color: Colors.grey[500],
                                    size: a*30/640,
                                  ),
                                  Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[500],
                                    size: a*30/640,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: CircleAvatar(
                              backgroundColor: Color(0xff075E54),
                              radius: 26,
                              child: IconButton(
                                icon: Icon(
                                  Icons.mic,
                                  size: a*30/640,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  /*Center(
                    child: Card(
                      child: Container(
                        height: keys,
                        color: Colors.black,
                      ),
                    ),
                  )*/

                ],
              ),
            ),
            Positioned(

              top: a/1.454545,
              left: b/1.33333,
              child: FloatingActionButton(
                elevation: 10,
                onPressed: (){
                  _addToChat(context);
                },
                child: Icon(Icons.add,size: a/20,),
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }


  }



Future <String> createDialog(BuildContext context){
  TextEditingController custom=TextEditingController();
  return showDialog(context: context,builder: (context){
    return AlertDialog(
      backgroundColor: Color(0xFFECE5DD),
      title: Text('Enter Text to Appear on Keyboard'),
      content: TextField(

        controller: custom,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.green),
              ),
            
              hintText: 'Type...'
          )
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
