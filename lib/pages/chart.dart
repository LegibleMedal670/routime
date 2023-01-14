import 'package:flutter/material.dart';
import 'package:untitled/models/blocks/image.dart';
import 'package:untitled/models/emotion.dart';
import 'package:untitled/models/running.dart';
import 'package:untitled/models/slider.dart';
import 'package:untitled/models/read_book.dart';
import 'package:untitled/models/weight.dart';

class chartPage extends StatefulWidget {
  const chartPage({Key? key}) : super(key: key);

  @override
  _chartPageState createState() => _chartPageState();
}

class _chartPageState extends State<chartPage> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      primary: false,
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.18,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: [
        sliderBlock(),
        readBlock(),
        runningBlock(),
        weightBlock(),
        emotionBlock(),
        imageBlock(),
      ],
    );
  }
}
