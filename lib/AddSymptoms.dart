import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utilities.dart';

class AddSymptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language.getAddSymptoms()),
      ),
    );
  }
}