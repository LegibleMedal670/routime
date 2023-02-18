import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class readBlock extends StatefulWidget {
  const readBlock({
    required this.blockName,
    required this.startPage,
    required this.endPage,
    required this.blockIcon,
    Key? key
  }) : super(key: key);

  final String blockName;
  final int startPage;
  final int endPage;
  final int blockIcon;


  @override
  _sliderBlockState createState() => _sliderBlockState();
}

class _sliderBlockState extends State<readBlock> {

  late int _startPage = widget.startPage;
  late int _endPage = widget.endPage;

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
                height: 20,
              ),
              Row(
                children: [
                  NumberPicker(
                    textStyle: TextStyle(fontSize: 10),
                    selectedTextStyle:
                        TextStyle(fontSize: 15, color: Colors.indigoAccent),
                    itemHeight: 22,
                    itemWidth: 80,
                    itemCount: 1,
                    value: _startPage,
                    maxValue: 300,
                    minValue: 1,
                    onChanged: (value) => setState(() {
                      _startPage = value;
                    }),
                  ),
                  Text('~'),
                  NumberPicker(
                    textStyle: TextStyle(fontSize: 10),
                    selectedTextStyle:
                        TextStyle(fontSize: 15, color: Colors.indigoAccent),
                    itemHeight: 22,
                    itemWidth: 80,
                    itemCount: 1,
                    value: _endPage,
                    maxValue: 300,
                    minValue: 1,
                    onChanged: (value) => setState(() {
                      _endPage = value;
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
