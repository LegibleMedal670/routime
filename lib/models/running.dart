import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class runningBlock extends StatefulWidget {
  const runningBlock({Key? key}) : super(key: key);

  @override
  _sliderBlockState createState() => _sliderBlockState();
}

class _sliderBlockState extends State<runningBlock> {

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
                    Icons.directions_run,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Running',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(width: 30,),
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
                  Text('km',style: TextStyle(fontSize: 20),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//지도연결해서하면조을듯