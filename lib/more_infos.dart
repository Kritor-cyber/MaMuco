
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class moreInfos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("plus d'infos"),
      ),
      body: ElevatedButton(
        onPressed: () async {
          await canLaunch("https://qwant.com") ? await launch("https://qwant.com") : throw 'Could not launch https://qwant.com';
        },
        child: Text("QWANT")
      ),
    );
  }
  
}