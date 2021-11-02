import 'package:flutter/material.dart';
import 'package:gtw/states/authen.dart';

Future<Null> signoutProcess(BuildContext context) async {
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => Authen(),
  );
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}
