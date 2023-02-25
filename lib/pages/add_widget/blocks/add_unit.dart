import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:provider/provider.dart';
import 'package:untitled/service/block_data.dart';

//개선점 : 단위 고르는 부분을 텍스트필드가 아닌 선택으로 변경하기

class add_unit extends StatefulWidget {
  const add_unit({Key? key}) : super(key: key);

  @override
  _add_unitState createState() => _add_unitState();
}

class _add_unitState extends State<add_unit> {
  int defaultIcon = 0xe3fe;
  final _blockNameController = TextEditingController();
  final _unitValueController = TextEditingController();

  void dispose() {
    _blockNameController.dispose();
    _unitValueController.dispose();
    super.dispose();
  }

  String unitName = 'unit';

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
              unitName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            TextButton(
              onPressed: () {
                add_unit();
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
                    unitName = newText;
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
        Row(
          children: [
            Text(
              ' 단위       | ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: TextField(
                controller: _unitValueController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  //나중에 validation 해줘서 정수만 되게
                    hintText: '단위 ( ex: kg, km, L )'),
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

  void add_unit() => context
      .read<blockService>()
      .add_unit(_blockNameController.text, defaultIcon, _unitValueController.text);

}
