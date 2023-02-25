import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:provider/provider.dart';
import 'package:untitled/service/block_data.dart';

//개선점 : 텍스트버튼을 아이콘버튼으로 변경하여 바꿀 때 마다 보이도록

class add_emotion extends StatefulWidget {
  const add_emotion({Key? key}) : super(key: key);

  @override
  State<add_emotion> createState() => _add_emotionState();
}

class _add_emotionState extends State<add_emotion> {
  int defaultIcon = 0xe3fe;
  final _blockNameController = TextEditingController();

  void dispose() {
    _blockNameController.dispose();
    super.dispose();
  }

  String emotionName = 'emotion';

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
              emotionName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            TextButton(
              onPressed: () {
                add_emotion();
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
              width: MediaQuery.of(context).size.width * 0.8,
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
                  IconData? icon = await FlutterIconPicker.showIconPicker(
                      context,
                      iconPackModes: [IconPack.material]);
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

  void add_emotion() => context
      .read<blockService>()
      .add_image(_blockNameController.text, defaultIcon);
}
