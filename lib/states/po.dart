import 'package:flutter/material.dart';
import 'package:gtw/widgets/show_signout.dart';


class PoPage extends StatefulWidget {
  const PoPage({ Key? key }) : super(key: key);

  @override
  _PoPageState createState() => _PoPageState();
}

class _PoPageState extends State<PoPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green.shade400,
        title: Text('ผู้อำนวยการ'),
      ),
      drawer: Drawer(
        child: ShowSignOut(),
      ),
    );
  }

 
}