import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class use extends StatelessWidget {
  var question_style=TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontFamily: 'BalsamiqSans',letterSpacing: 1.8,fontSize: 19);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('HOW IT WORKS'),
      ),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
              ExpansionTile(
                leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
                title: Text('How to Change Username/Status?',style: question_style ,),
              ),
            SizedBox(height: 20,),
            ExpansionTile(
              leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
              title: Text('How to Change Profile Picture?',style: question_style,),
            ),
            SizedBox(height: 20,),
            ExpansionTile(
              leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
              title: Text('How to Edit Text Messages?',style: question_style),
            ),
            SizedBox(height: 20,),
            ExpansionTile(
              leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
              title: Text('How to Add Photos to Chat?',style: question_style),
            ),
            SizedBox(height: 20,),
            ExpansionTile(
              leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
              title: Text('How to Add Deleted Messages?',style: question_style),
            ),
            SizedBox(height: 20,),
            ExpansionTile(
              leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
              title: Text('How to Add Dividers?',style: question_style),
            ),SizedBox(height: 20,),
            ExpansionTile(
              leading: new Icon(FontAwesomeIcons.meteor,color: Colors.green,),
              title: Text('How to Add Text to Keyboard ?',style: question_style),
            ),

          ],
        ),
      ),
    );
  }
}
