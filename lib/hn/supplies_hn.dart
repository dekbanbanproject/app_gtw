import 'package:flutter/material.dart';

class SuppliesHn extends StatefulWidget {
  const SuppliesHn({ Key? key }) : super(key: key);

  @override
  _SuppliesHnState createState() => _SuppliesHnState();
}

class _SuppliesHnState extends State<SuppliesHn> {
  @override
  Widget build(BuildContext context) {
     return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [Text('Data Supplies')
            // charts.BarChart(
            //   chartData(Dbgleave),
            //   animate: true,
            // vertical: false,
            // )
          ],
        ),
      ),
    );
  }
}