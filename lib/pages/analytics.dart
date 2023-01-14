import 'package:flutter/material.dart';

class analyticsPage extends StatefulWidget {
  const analyticsPage({Key? key}) : super(key: key);

  @override
  _analyticsPageState createState() => _analyticsPageState();
}

class _analyticsPageState extends State<analyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '분석',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );;
  }
}
