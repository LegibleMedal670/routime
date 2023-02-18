import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


//넘버피커 수정필요

class unitBlock extends StatefulWidget {
  const unitBlock({
    required this.blockName,
    required this.blockIcon,
    double? initValue = 0,
    required this.unit,
    Key? key,
  }) : super(key: key);

  final String blockName;
  final int blockIcon;
  final String unit;
  final double? initValue = 0;

  @override
  _unitBlockState createState() => _unitBlockState();
}

class _unitBlockState extends State<unitBlock> {
  int _runnungdistance = 0;

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
                    IconData(widget.blockIcon, fontFamily: 'MaterialIcons')
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
                  SizedBox(
                    width: 30,
                  ),
                  NumberPicker(
                    textStyle: TextStyle(fontSize: 10),
                    selectedTextStyle:
                        TextStyle(fontSize: 15, color: Colors.indigoAccent),
                    itemHeight: 22,
                    itemWidth: 80,
                    itemCount: 1,
                    value: _runnungdistance,
                    maxValue: 300,
                    minValue: 0,
                    onChanged: (value) => setState(() {
                      _runnungdistance = value;
                    }),
                  ),
                  Text(
                    widget.unit,
                    style: TextStyle(fontSize: 20),
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
