import 'package:flutter/material.dart';
import 'package:untitled/pages/add_widget/blocks/add_slider.dart';
import 'package:untitled/pages/add_widget/blocks/add_unit.dart';

class analyticsPage extends StatefulWidget {
  const analyticsPage({Key? key}) : super(key: key);

  @override
  _analyticsPageState createState() => _analyticsPageState();
}

class _analyticsPageState extends State<analyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: add_unit()
    );
  }
}
