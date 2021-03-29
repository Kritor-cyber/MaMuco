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
    );
  }
}