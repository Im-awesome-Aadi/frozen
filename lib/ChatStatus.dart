import 'package:flutter/material.dart';

class ChatStatus extends StatefulWidget {
  ChatStatus({this.s,this.del});
  var s;
  bool del;
  @override
  _ChatStatusState createState() => _ChatStatusState();
}

class _ChatStatusState extends State<ChatStatus> {
  var seen=1;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[

        Row(
          children: <Widget>[
            Radio(
              value: 1,groupValue: seen,activeColor: Colors.green,
              onChanged: (val){
                setState(() {
                  seen=val;

                  widget.s.removeAt(0);
                  widget.s.insert(0,seen);
                  print("Seen");
                });

              },

            ),
            Text('Seen'),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(value: 2,groupValue: seen,activeColor: Colors.green,
              onChanged: (val){
                setState(() {
                  seen=val;

                  widget.s.removeAt(0);
                  widget.s.insert(0,seen);
                  print("Delivered");
                });
              },
            ),
            Text('Delivered'),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(value: 3,groupValue: seen,activeColor: Colors.green,
              onChanged: (val){
                setState(() {
                  seen=val;

                  widget.s.removeAt(0);
                  widget.s.insert(0,seen);
                  print("Not deliered");
                });
              },
            ),
            Text('Not Delivered'),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(value: 4,groupValue: seen,activeColor: Colors.green,
              onChanged: (val){
                setState(() {
                  seen=val;

                  widget.s.removeAt(0);
                  widget.s.insert(0,seen);
                  print("Not sent");

                });
              },
            ),
            Text('Not Sent'),
          ],
        )
      ],
    );
  }
}
