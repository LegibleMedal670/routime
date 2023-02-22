import 'package:flutter/material.dart';
import 'package:untitled/models/blocks/image.dart';
import 'package:untitled/models/blocks/emotion.dart';
import 'package:untitled/models/blocks/units.dart';
import 'package:untitled/models/blocks/slider.dart';
import 'package:untitled/models/blocks/read_book.dart';
import 'package:untitled/models/blocks/weight.dart';

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
        //sliderBlock(),
        //readBlock(),
        unitBlock(unit: 'L', blockIcon: 0xf05a2, initValue: null, blockName: 'Water',),
        weightBlock(),
        emotionBlock(blockIcon: 0xe3ff, blockName: "Today's Imotion",),
        imageBlock(blockName: '이미쥐', blockIcon: 0xf80d,),
      ],
    );
  }
}
