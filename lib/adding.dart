import 'package:flutter/material.dart';
import 'package:frozen/ChatStatus.dart';

class adds extends StatefulWidget {
  adds({this.abc,this.long,this.short,this.custom1,this.custom2,this.custom,this.msg,this.time,this.type,this.ismsgdel,this.images,this.div});
  final abc;
  final long;
  final short;
  final custom1;
  final custom2;
  final custom;
  var msg;
  var time;
  var type;
  var ismsgdel;
  var images;
  var div;
  @override
  _addsState createState() => _addsState();
}

class _addsState extends State<adds> {
  void initState(){
    super.initState();
     //selectedradio=1;
  }
  String _selectedLocation = 'Please choose a location';
  List<String> locations = ['A', 'B', 'C', 'D'];
  List s=[1];
  int chatType=2;    // Either Send message or Recd. Message
  bool del=false;      // For "This message was deleted"
  int sentchatStatus=2;   // Either seen,delivered, undelivered or not sent.

  TextEditingController toms=TextEditingController();

  @override
  Widget build(BuildContext context) {
    //toms.text="This message was deleted";


    return AlertDialog(


      backgroundColor: Color(0xFFECE5DD),
      // title: Text('Add Text',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.green,),),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: widget.long/256,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: 1,groupValue: chatType,activeColor: Colors.blue,
                      onChanged: (val){
                        chatType=val;
                        setState(() {


                        });
                        print(chatType);

                      },

                    ),
                    Text('Received'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(value: 2,groupValue: chatType,activeColor: Colors.blue,
                      onChanged: (val){
                        chatType=val;
                        setState(() {


                        });
                        print(chatType);
                      },
                    ),
                    Text('Sent'),
                  ],
                )
              ],
            ),
            SizedBox(height: widget.long/256,),
            Divider(color: Colors.black,thickness: 2,),
            SizedBox(height: widget.long/256,),
            Row(
              children: <Widget>[
                Checkbox(
                  value: del,
                  onChanged: (bool val){
                    if(del==true){
                      setState(() {
                        del=false;
                        print(del);

                      });
                    }
                    else{
                      setState(() {
                        del=true;
                        chatType==2?toms.text="You deleted this message":toms.text="This message was deleted";
                        print(toms.text);

                      });
                    }
                  },

                ),
                Text('Add Deleted Message')
              ],
            ),
            SizedBox(height: widget.long/128,),
            SizedBox(height: widget.long/128,),
            del==true?SizedBox.shrink()
                :Container(
              margin: EdgeInsets.symmetric(vertical: widget.long/64,horizontal: widget.short/36),

              child: TextField(
                textInputAction: TextInputAction.newline,
                maxLines: 3,
                keyboardType: TextInputType.text,
                controller: del==true?toms:widget.custom,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    labelText: chatType==1?'Recieved Message':'Send Message',
                  hintText: 'Type...'
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
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelText: chatType==1?'Recieved Time':'Send Time',
                        hintText: 'Type...'
                    ),

                  ),
                ),
                Flexible(
                  child: TextField(

                    keyboardType: TextInputType.number,
                    controller: widget.custom2,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelText: chatType==1?'Recieved Time':'Send Time',
                        hintText: 'Type...'
                    ),

                  ),
                ),
              ],
            ),
            SizedBox(height: widget.long/128,),
            (chatType==1 || del==true)?
            SizedBox(height: widget.long/128,):

            ChatStatus(s: s,del: del,),
            FlatButton(
              onPressed: (){
                if(del==true?((widget.custom1.text.isEmpty || widget.custom2.text.isEmpty)):(widget.custom.text.isEmpty || (widget.custom1.text.isEmpty || widget.custom2.text.isEmpty))){
                  print('Sorry');
                }
                // print(abc.length*10);

                else{
                  setState(() {
                  widget.abc.add(
                      Row(

                        mainAxisAlignment: chatType==1?MainAxisAlignment.start:MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //height: 170,
                        //width: 10,
                        //color: Colors.blue,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints:BoxConstraints(maxWidth: widget.short/1.44),
                            child: Container(

                              margin:EdgeInsets.symmetric(vertical: widget.long/640,horizontal: widget.short/360),
                              padding:EdgeInsets.symmetric(vertical: widget.long/160,horizontal: widget.short/90),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                //  textDirection: TextDirection.rtl,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                //crossAxisAlignment: WrapCrossAlignment.end,
                                children: <Widget>[

                                  Container(
                                    child: Wrap(
                                      children: <Widget>[
                                        del==false?SizedBox.shrink():Icon(Icons.do_not_disturb,color: Colors.grey,size: widget.long/40,),
                                        RichText(
                                          text: TextSpan(
                                              text: del==true?' ${toms.text} ':'${widget.custom.text}              ',
                                              style: TextStyle(color: del==true?Colors.grey:Colors.black,fontSize: widget.long/42.5,fontStyle: del==true?FontStyle.italic:FontStyle.normal),
                                              children: <TextSpan>[
                                                //  TextSpan(text: '${widget.customs.text}',style: TextStyle(color: Colors.grey,fontSize: widget.long/64,)),
                                              ]
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Wrap(
                                      children: <Widget>[
                                        Text('${widget.custom1.text + ':' + widget.custom2.text}',style: TextStyle(color: Colors.grey,fontSize: widget.long/64,),textAlign: TextAlign.right,),
                                        SizedBox(width: widget.short/90,),
                                        chatType==2?del==true?SizedBox.shrink():Container(
                                          // margin: EdgeInsets.only(top: widget.long/128),
                                          width: widget.short/24,
                                          child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Icon(
                                                s[0]<=2?Icons.done_all:s[0]==3?Icons.done:Icons.alarm

                                                ,size: widget.long/42.5,
                                                color: s[0]==1?Colors.blue:Colors.grey,)),
                                        ):SizedBox.shrink()

                                      ],
                                    ),
                                  ),

                                  SizedBox(width: widget.short/72,),

                                ],
                              ),
                              decoration: BoxDecoration(
                                color: chatType==1?Colors.white:Color(0xFFE4FDC6),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)
                                ),
                              ),
                            ),
                          ),


                        ],
                      )

                  );

                  widget.msg.add(
                    del==true?toms.text:widget.custom.text,
                  );
                  widget.time.add(
                    widget.custom1.text+widget.custom2.text,
                  );

                  widget.type.add(
                    chatType==2?2:1,
                  );
                  widget.ismsgdel.add(
                      del==true?1:0
                  );
                  widget.images.add(
                      null
                  );
                  widget.div.add(
                      0
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
