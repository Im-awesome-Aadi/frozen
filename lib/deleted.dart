import 'package:flutter/material.dart';

class deleted extends StatefulWidget {
  deleted({this.abc});
  final abc;
  @override
  _deletedState createState() => _deletedState();
}

class _deletedState extends State<deleted> {
  int selectedradio=1;
  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      title: Text('Add Deleted Message'),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        FlatButton(
          onPressed: (){
            setState(() {
              print("My time came");
              widget.abc.add(
                Row(
                  mainAxisAlignment: selectedradio==1?MainAxisAlignment.start:MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Container(
                        margin:EdgeInsets.all(1),
                        padding:EdgeInsets.all(5),
                        child: selectedradio==1?Text('This message was deleted',style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic)):Text('You deleted this message',style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),),
                        decoration: BoxDecoration(
                          color: selectedradio==1?Colors.white:Color(0xFFE4FDC6),
                          borderRadius: BorderRadius.all(
                              Radius.circular(5)
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              );
            });
            Navigator.of(context).pop(context);

          },
          child: Container(
            padding: EdgeInsets.all(5),
    height: 60,
    width: double.infinity,
    child: Card(color:Colors.blue,child: Center(child: Text('Add',style: TextStyle(color: Colors.white),),),)),
        )
      ],
    );
  }
}
