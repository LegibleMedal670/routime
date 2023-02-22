import 'package:flutter/material.dart';

class groupPage extends StatefulWidget {
  const groupPage({Key? key}) : super(key: key);

  @override
  _groupPageState createState() => _groupPageState();
}

class _groupPageState extends State<groupPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '그룹',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }
}
