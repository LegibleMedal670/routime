import 'package:flutter/material.dart';

class add_slider extends StatefulWidget {
  const add_slider({Key? key}) : super(key: key);

  @override
  _add_sliderState createState() => _add_sliderState();
}

class _add_sliderState extends State<add_slider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                //Navigator.pop(context);
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
              'Slider',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            TextButton(
              onPressed: () {

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
        Column(
          children: [
            Row(
              children: [
                Text('이름'),
                SizedBox(width: 30,),
                Text('텍스트필드예정')
              ],
            ),
            Row(
              children: [
                Text('아이콘'),
                SizedBox(width: 30,),
                Text('선택버튼예정')
              ],
            ),
            Row(
              children: [
                Text('최대길이'),
                SizedBox(width: 30,),
                Text('최대길이선택예정')
              ],
            ),
          ],
        ),
      ],
    );
  }
}
