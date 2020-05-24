import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class photo extends StatefulWidget {
  photo({this.abc,this.long,this.short,this.custom,this.custom1,this.custom2,this.msg,this.time,this.type,this.ismsgdel,this.images,this.div});
  final abc;
  final long;
  final short;
  final custom;
  final custom1;
  final custom2;
  var msg;
  var time;
  var type;
  var ismsgdel;
  var images;
  var div;
  @override
  _photoState createState() => _photoState();
}

class _photoState extends State<photo> {
  var img;
  bool isImageadded=false;
  int selectedradio =1;
  int status=1;
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        img=FileImage(image);
        isImageadded=true;
        print(img.runtimeType);
      });
    }
    void _addPhoto(context){
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc){
            return Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                      title: new Text('Choose Image from Gallery'),
                      onTap: getImage
                  ),
                  new ListTile(
                    leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                    title: new Text('Choose Image from Camera'),
                    //onTap: getCameraImage,
                  ),

                ],
              ),
            );
          }
      );
    }

    return AlertDialog(


      backgroundColor: Color(0xFFECE5DD),
      // title: Text('Add Text',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.green,),),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: widget.long/128,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: 1,groupValue: selectedradio,activeColor: Colors.green,
                      onChanged: (val){
                        setState(() {
                          selectedradio=val;

                        });
                        print(selectedradio);

                      },

                    ),
                    Text('Sent'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(value: 2,groupValue: selectedradio,activeColor: Colors.green,
                      onChanged: (val){
                        setState(() {
                          selectedradio=val;

                        });
                        print(selectedradio);
                      },
                    ),
                    Text('Received'),
                  ],
                )
              ],
            ),

            SizedBox(height: widget.long/128,),
            RaisedButton(
              onPressed: (){
                _addPhoto(context);
              },
              child: Text('Choose Image'),
            ),
            SizedBox(height: widget.long/128,),
            Container(
              margin: EdgeInsets.symmetric(vertical: widget.long/64,horizontal: widget.short/36),

              child: TextField(
                textInputAction: TextInputAction.newline,
                maxLines: 3,
                keyboardType: TextInputType.text,
                controller: widget.custom,
                decoration: InputDecoration(
                    hintText: 'Type the Message'
                ),

              ),
            ),
            SizedBox(height: widget.long/128,),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(

                    keyboardType: TextInputType.number,
                    controller: widget.custom1,
                    decoration: InputDecoration(
                        hintText: 'Enter Time'
                    ),

                  ),
                ),
                Flexible(
                  child: TextField(

                    keyboardType: TextInputType.number,
                    controller: widget.custom2,
                    decoration: InputDecoration(
                        hintText: 'Enter Time'
                    ),

                  ),
                )
              ],
            ),
            SizedBox(height: widget.long/128,),
            selectedradio==2?Wrap(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: 1,groupValue: status,activeColor: Colors.green,
                      onChanged: (val){
                        setState(() {
                          status=val;

                        });

                      },

                    ),
                    Text('Seen'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(value: 2,groupValue: status,activeColor: Colors.green,
                      onChanged: (val){
                        setState(() {
                          status=val;

                        });
                      },
                    ),
                    Text('Delivered'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(value: 3,groupValue: status,activeColor: Colors.green,
                      onChanged: (val){
                        setState(() {
                          status=val;

                        });
                      },
                    ),
                    Text('Not Delivered'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(value: 4,groupValue: status,activeColor: Colors.green,
                      onChanged: (val){
                        setState(() {
                          status=val;

                        });
                      },
                    ),
                    Text('Not Sent'),
                  ],
                )
              ],
            ):
            SizedBox(height: widget.long/128,),
            FlatButton(
              onPressed: (){
                if(widget.custom1.text.isEmpty || isImageadded==false){
                  print('Sorry');
                }
                // print(abc.length*10);

                else{
                  setState(() {
                    widget.abc.add(
                        Row(
                          mainAxisAlignment: selectedradio==1?MainAxisAlignment.start:MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              decoration:BoxDecoration(
                                color:selectedradio==1?Colors.white:Color(0xFFE4FDC6),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15)
                                  )
                              ),
                              margin: EdgeInsets.all(1),

                            child:ConstrainedBox(

                              constraints: BoxConstraints(maxWidth: widget.short/1.8,),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration:BoxDecoration(
                                    color:selectedradio==1?Colors.white:Color(0xFFE4FDC6),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)
                                    )
                                ),
                                child: Column(
                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                                  children: <Widget>[
                                    Container(
                                        height: widget.long*170/640,
                                      decoration:BoxDecoration(
                                          color:selectedradio==1?Colors.white:Color(0xFFE4FDC6),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)
                                          )
                                      ),
                                      child: ConstrainedBox(

                                        constraints: BoxConstraints(maxWidth: widget.short/1.8,maxHeight: widget.long/1.8),
                                        child: Center(child: Image(image:img,fit: BoxFit.contain,)),
                                      ),
                                    ),
                                    Container(

                                      decoration:BoxDecoration(
                                          color:selectedradio==1?Colors.white:Color(0xFFE4FDC6),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)
                                          )
                                      ),
                                      child: ConstrainedBox(

                                        constraints: BoxConstraints(maxWidth: widget.short/1.8),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('${widget.custom.text}')),
                                      ),
                                    ),
                                    Container(

                                      decoration:BoxDecoration(
                                          color:selectedradio==1?Colors.white:Color(0xFFE4FDC6),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)
                                          )
                                      ),
                                      child: ConstrainedBox(

                                        constraints: BoxConstraints(maxWidth: widget.short/1.8),
                                        child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                                Text('${widget.custom1.text + ':' +widget.custom2.text}',style: TextStyle(fontSize: 10,color: Colors.grey),),
                                                selectedradio==2?Container(
                                                  margin: EdgeInsets.only(top: widget.long/128),
                                                  width: widget.short/24,
                                                  child: Align(
                                                      alignment: Alignment.bottomRight,
                                                      child: Icon(
                                                        status<=2?Icons.done_all:status==3?Icons.done:Icons.alarm

                                                        ,size: widget.long/42.5,
                                                        color: status==1?Colors.blue:Colors.grey,)),
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

                        )

                    );
                    widget.div.add(
                        0
                    );
                    widget.msg.add(
                      widget.custom.text,
                    );
                    widget.time.add(
                      widget.custom1.text+widget.custom2.text,
                    );

                    widget.type.add(
                      selectedradio==2?2:1,
                    );
                    widget.ismsgdel.add(
                        0
                    );
                    widget.images.add(
                          img
                    );
                  });

                  Navigator.pop(context);

                }
              },

              child: Container(
                height: widget.long/12.8,
                width: double.infinity,
                //color: Colors.green,
                child: Card(
                    color: Colors.green,
                    child: Center(child: Text('Add Text',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
