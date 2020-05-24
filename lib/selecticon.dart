import 'package:flutter/material.dart';

class select extends StatefulWidget {
  select({this.ismsgdel,this.index,this.s});
  var ismsgdel;  //List
  var index;
  var s;  //List of only one element
  @override
  _selectState createState() => _selectState();
}

class _selectState extends State<select> {
  var seen=1;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        widget.ismsgdel[widget.index-1]==1?SizedBox.shrink():Row(
          children: <Widget>[
            Radio(
              value: 1,groupValue: seen,activeColor: Colors.green,
              onChanged: (val){
                setState(() {
                  seen=val;
                  widget.s.removeAt(0);
                  widget.s.insert(0,seen);
                });

              },

            ),
            Text('Seen'),
          ],
        ),
        widget.ismsgdel[widget.index-1]==1?SizedBox.shrink():Row(
          children: <Widget>[
            Radio(value: 2,groupValue: seen,activeColor: Colors.green,
              onChanged: (val){
                setState(() {

                  seen=val;
                  widget.s.removeAt(0);
                  print("Value of seen is $seen");

                  widget.s.insert(0,seen);

                });
              },
            ),
            Text('Delivered'),
          ],
        ),
        widget.ismsgdel[widget.index-1]==1?SizedBox.shrink():Row(
          children: <Widget>[
            Radio(value: 3,groupValue: seen,activeColor: Colors.green,
              onChanged: (val){
                setState(() {
                  seen=val;
                  widget.s.removeAt(0);
                  print("Value of seen is $seen");
                  widget.s.insert(0,seen);
                });

              },
            ),
            Text('Not Delivered'),
          ],
        ),
        widget.ismsgdel[widget.index-1]==1?SizedBox.shrink():Row(
          children: <Widget>[
            Radio(value: 4,groupValue: seen,activeColor: Colors.green,
              onChanged: (val){
                setState(() {
                  seen=val;
                  print("Value of seen is $seen");
                  widget.s.removeAt(0);
                  widget.s.insert(0,seen);

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
