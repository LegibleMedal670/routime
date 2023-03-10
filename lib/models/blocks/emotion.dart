import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';


class emotionBlock extends StatefulWidget {
  const emotionBlock({
    required this.blockName,
    required this.blockIcon,
    Key? key,
  }) : super(key: key);

  final String blockName;
  final int blockIcon;

  @override
  _sliderBlockState createState() => _sliderBlockState();
}

class _sliderBlockState extends State<emotionBlock> {

  int defaultIcon = 0xe3fe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: 100,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                      IconData(
                          widget.blockIcon, fontFamily: 'MaterialIcons'
                      )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.blockName,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  IconData? icon =
                  await FlutterIconPicker.showIconPicker(
                      context, iconPackModes: [IconPack.material]);
                  setState(() {
                    defaultIcon = icon!.codePoint;
                  });
                },
                child: Icon(          //????????? mood ????????? ???????????? ????????? ???????????? 3????????????
                  IconData(
                    defaultIcon,
                    fontFamily: 'MaterialIcons'
                  ),
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
