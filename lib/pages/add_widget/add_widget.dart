import 'package:flutter/material.dart';
import 'package:untitled/models/blocks/image.dart';
import 'package:untitled/models/emotion.dart';
import 'package:untitled/models/running.dart';
import 'package:untitled/models/slider.dart';
import 'package:untitled/models/read_book.dart';
import 'package:untitled/models/weight.dart';

class add_widget extends StatefulWidget {
  const add_widget({Key? key}) : super(key: key);

  @override
  _add_widgetState createState() => _add_widgetState();
}

class _add_widgetState extends State<add_widget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              '과제',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '추가',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      print('slider');
                    },
                    child: AbsorbPointer(
                      child: sliderBlock(),
                      absorbing: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('run');
                    },
                    child: AbsorbPointer(
                      child: runningBlock(),
                      absorbing: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('image');
                    },
                    child: AbsorbPointer(
                      child: imageBlock(),
                      absorbing: true,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                children: [
                  GestureDetector(
                    onTap: (){
                      print('read');
                    },
                    child: AbsorbPointer(
                      child: readBlock(),
                      absorbing: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('weight');
                    },
                    child: AbsorbPointer(
                      child: weightBlock(),
                      absorbing: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('emotion');
                    },
                    child: AbsorbPointer(
                      child: emotionBlock(),
                      absorbing: true,
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
      ],
    );
  }
}
