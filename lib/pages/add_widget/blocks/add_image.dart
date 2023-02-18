import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class add_image extends StatefulWidget {
  const add_image({Key? key}) : super(key: key);

  @override
  _add_imageState createState() => _add_imageState();
}

class _add_imageState extends State<add_image> {
  int defaultIcon = 0xe3fe;
  final _blockNameController = TextEditingController();
  final _maxValueController = TextEditingController();

  void dispose() {
    _blockNameController.dispose();
    _maxValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
}
