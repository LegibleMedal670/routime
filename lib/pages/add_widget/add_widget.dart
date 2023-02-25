import 'package:untitled/pages/add_widget/blocks/add_emotion.dart';
import 'package:untitled/pages/add_widget/blocks/add_slider.dart';
import 'package:untitled/pages/add_widget/blocks/add_image.dart';
import 'package:untitled/pages/add_widget/blocks/add_read.dart';
import 'package:untitled/pages/add_widget/blocks/add_unit.dart';
import 'package:untitled/models/blocks/read_book.dart';
import 'package:untitled/models/blocks/emotion.dart';
import 'package:untitled/models/blocks/slider.dart';
import 'package:untitled/models/blocks/units.dart';
import 'package:untitled/models/blocks/image.dart';
import 'package:untitled/service/block_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class add_widget extends StatefulWidget {
  const add_widget({Key? key}) : super(key: key);



  @override
  _add_widgetState createState() => _add_widgetState();
}

class _add_widgetState extends State<add_widget> {
  String blockName = 'add_widget';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      child: Column(
        children: [

          SizedBox(
            height: 10,
          ),
          (blockName == 'add_widget')
              ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '취소',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Text(
                        '블럭',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text(
                          '추가',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  blockName = 'slider';
                                });
                              },
                              child: AbsorbPointer(
                                child: sliderBlock(
                                  blockIcon: 0xe1e1,
                                  maxSliderValue: 8,
                                  blockName: 'SliderBlock',
                                ),
                                absorbing: true,
                              ),
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  blockName = 'unit';
                                });
                              },
                              child: AbsorbPointer(
                                child: unitBlock(
                                  unit: 'L',
                                  blockIcon: 0xf05a2,
                                  initValue: null,
                                  blockName: 'UnitBlock',
                                ),
                                absorbing: true,
                              ),
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  blockName = 'image';
                                });
                              },
                              child: AbsorbPointer(
                                child: imageBlock(
                                  blockName: 'ImageBlock',
                                  blockIcon: 0xf80d,
                                ),
                                absorbing: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  blockName = 'read';
                                });
                              },
                              child: AbsorbPointer(
                                child: readBlock(
                                  blockName: 'ReadBlock',
                                  startPage: 1,
                                  endPage: 200,
                                  blockIcon: 0xe0ef,
                                ),
                                absorbing: true,
                              ),
                            ),
                            // SizedBox(
                            //   height: 45,
                            // ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  blockName = 'emotion';
                                });
                              },
                              child: AbsorbPointer(
                                child: emotionBlock(
                                  blockIcon: 0xe3ff,
                                  blockName: "EmotionBlock",
                                ),
                                absorbing: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              )
              : getBlocks(blockName),
        ],
      ),
    );
  }
}

Widget getBlocks(blockName) {
  switch (blockName) {
    case 'slider':
      return add_slider();
    case 'unit':
      return add_unit();
    case 'image':
      return add_image();
    case 'emotion':
      return add_emotion();
    case 'read':
      return add_read();
    default:
      return Center(
        child: Text(
          'ERROR!!!!!!!!!!!!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 123, color: Colors.green),
        ),
      );
  }
}
