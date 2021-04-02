import 'utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAddEvents()),
      ),
      body: SingleChildScrollView(
        child:Container(
          padding:EdgeInsets.symmetric(vertical:50.0, horizontal: 30.0),
          child: Form(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: language.getNameEvent(),
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: language.getDate(),
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: language.getHour(),
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: language.getDetails(),
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: (){
                  },
                  child: Text(language.getValidate(),
                    style:TextStyle(color: Colors.blue),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}