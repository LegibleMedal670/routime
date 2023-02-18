import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/pages/add_widget/add_widget.dart';
import 'package:untitled/models/blocks/image.dart';
import 'package:untitled/models/blocks/read_book.dart';
import 'package:untitled/models/blocks/emotion.dart';
import 'package:untitled/models/blocks/units.dart';
import 'package:untitled/models/blocks/slider.dart';
import 'package:untitled/models/blocks/weight.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class communityPage extends StatefulWidget {
  const communityPage({Key? key}) : super(key: key);

  @override
  _communityPageState createState() => _communityPageState();
}

class _communityPageState extends State<communityPage> {
  var date = new DateTime.now();
  late String formatDate = DateFormat.MMMEd('ko').format(date);

  List<Widget> testWidgets = <Widget>[
    sliderBlock(blockIcon: 0xe1e1, maxSliderValue: 8, blockName: 'test',),
    readBlock(blockName: '포테토칩이', startPage: 18, endPage: 200, blockIcon: 0xe0ef,),
    unitBlock(unit: 'L', blockIcon: 0xf05a2, initValue: null, blockName: 'Water',),
    imageBlock(blockName: '이미쥐', blockIcon: 0xf80d,),
    unitBlock(unit: 'kg', blockIcon: 0xe28d, initValue: null, blockName: 'Weight',),
    emotionBlock(blockIcon: 0xe3ff, blockName: "Today's Imotion",),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //padding: EdgeInsets.only(left: 100, right: 100),
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  date = date.subtract(Duration(days: 1));
                  setState(() {
                    formatDate = DateFormat.MMMEd('ko').format(date);
                  });
                  print(date);
                },
                icon: Icon(Icons.arrow_left),
                iconSize: 50,
              ),
              Text(formatDate),
              IconButton(
                onPressed: () {
                  date = date.add(Duration(days: 1));
                  setState(() {
                    formatDate = DateFormat.MMMEd('ko').format(date);
                  });
                  print(date);
                },
                icon: Icon(Icons.arrow_right),
                iconSize: 50,
              ),
            ],
          ),
          Expanded(
              child: MasonryGridView.builder(
            crossAxisSpacing: 3,
            mainAxisSpacing: 10,
            itemCount: testWidgets.length,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return testWidgets[index];
            },
          )),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMaterialModalBottomSheet(
            context: context,
            builder: (context) => SafeArea(child: add_widget()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
