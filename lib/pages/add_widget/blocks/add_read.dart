import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:provider/provider.dart';
import 'package:untitled/service/block_data.dart';

//개선점 : 텍스트필드에서 선택으로 변경

class add_read extends StatefulWidget {
  const add_read({Key? key}) : super(key: key);

  @override
  State<add_read> createState() => _add_readState();
}

class _add_readState extends State<add_read> {
  int defaultIcon = 0xe0ef;
  final _blockNameController = TextEditingController();
  final _maxValueController = TextEditingController();
  final _minimunValueController = TextEditingController();

  void dispose() {
    _blockNameController.dispose();
    _maxValueController.dispose();
    _minimunValueController.dispose();
    super.dispose();
  }

  String readName = 'read';

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
              readName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            TextButton(
              onPressed: () {
                add_read();
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
        Row(
          children: [
            Text(
              ' 이름       | ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: TextField(
                controller: _blockNameController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(hintText: '블럭 이름'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              ' 시작       | ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: TextField(
                controller: _minimunValueController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  //나중에 validation 해줘서 정수만 되게
                    hintText: '시작 페이지'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Text(
              ' 마지막     | ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: TextField(
                controller: _maxValueController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    hintText: '마지막 페이지'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Text(
              ' 아이콘    | ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  IconData? icon =
                  await FlutterIconPicker.showIconPicker(
                      context, iconPackModes: [IconPack.material]);
                  setState(() {
                    defaultIcon = icon!.codePoint;
                  });
                  print(defaultIcon);
                },
                child: Text('아이콘 선택')),
          ],
        ),
      ],
    );
  }

  void add_read() =>
      context.read<blockService>().add_read(
          _blockNameController.text, int.parse(_minimunValueController.text), int.parse(_maxValueController.text), defaultIcon);
}
