import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:provider/provider.dart';
import 'package:untitled/service/block_data.dart';

//개선점 : 아이콘 선택 버튼을 텍스트버튼에서 아이콘버튼으로 변경하여 바꾸면 보이게

class add_image extends StatefulWidget {
  const add_image({Key? key}) : super(key: key);

  @override
  _add_imageState createState() => _add_imageState();
}

class _add_imageState extends State<add_image> {
  int defaultIcon = 0xe3fe;
  final _blockNameController = TextEditingController();

  void dispose() {
    _blockNameController.dispose();
    super.dispose();
  }

  String imageName = 'image';

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
              imageName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            TextButton(
              onPressed: () {
                add_image();
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
                onChanged: (newText){
                  setState(() {
                    imageName = newText;
                  });
                  },
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

  void add_image() =>
      context
          .read<blockService>()
          .add_image(_blockNameController.text, defaultIcon);
}
