import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled/models/blocks/image.dart';
import 'package:untitled/models/emotion.dart';
import 'package:untitled/models/read_book.dart';
import 'package:untitled/models/running.dart';
import 'package:untitled/models/slider.dart';
import 'package:untitled/models/weight.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/pages/add_widget/add_widget.dart';

class communityPage extends StatefulWidget {
  const communityPage({Key? key}) : super(key: key);

  @override
  _communityPageState createState() => _communityPageState();
}

class _communityPageState extends State<communityPage> {
  var date = new DateTime.now();
  late String formatDate = DateFormat.MMMEd('ko').format(date);

  List<Widget> testWidgets = <Widget>[
    sliderBlock(),
    readBlock(),
    runningBlock(),
    imageBlock(),
    weightBlock(),
    emotionBlock(),
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
