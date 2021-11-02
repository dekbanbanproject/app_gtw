import 'package:flutter/material.dart';

class DisStyle {

  Color orangColor = Colors.orange.shade900;
  Color primaryColor = Colors.blue;
  Color successColor = Colors.lightGreen;
  Color dangerColor = Colors.red;
  Color purColor = Colors.purple;
  Color writeColor = Colors.white;

    Container showlogo() {
    return Container(
      width: 160.0,
      child: Image.asset('images/logogtw.png'),
    );
  }
TextStyle HeaderVersion = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.redAccent,
  );

}