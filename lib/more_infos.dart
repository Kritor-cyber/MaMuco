import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class moreInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("plus d'infos"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () async {
                await canLaunch("https://www.vaincrelamuco.org/")
                    ? await launch("https://www.vaincrelamuco.org/")
                    : throw 'Could not launch https://www.vaincrelamuco.org/';
              },
              child: Image.network(
                  'https://www.vaincrelamuco.org/sites/all/themes/custom/vlm/images/vlm_logo.png', isAntiAlias: true, scale: 0.9, filterQuality: FilterQuality.high),
              style: ButtonStyle(
                //padding: EdgeInsets.all(0),
                padding:
                MaterialStateProperty.resolveWith<EdgeInsets>((states) {
                  return EdgeInsets.all(10);
                }),
              ),
            ),
            OutlinedButton(
              onPressed: () async {
                await canLaunch("https://association-gregorylemarchal.org/")
                    ? await launch("https://association-gregorylemarchal.org/")
                    : throw 'Could not launch https://association-gregorylemarchal.org/';
              },
              child: Image.network(
                  'https://association-gregorylemarchal.org/dist/images/front/logo_home2.png', isAntiAlias: true, filterQuality: FilterQuality.high),
              style: ButtonStyle(
                //padding: EdgeInsets.all(0),
                padding: MaterialStateProperty.resolveWith<EdgeInsets>((states) {
                  return EdgeInsets.all(10);
                }),
                backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                  return Color.fromRGBO(35, 22, 79, 1);
                }),
              ),
            ),
          ],
        )
      )
    );
  }
}
