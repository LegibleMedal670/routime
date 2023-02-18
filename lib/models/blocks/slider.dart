import 'package:flutter/material.dart';

class sliderBlock extends StatefulWidget {
  const sliderBlock({
    required this.blockName,
    required this.maxSliderValue,
    required this.blockIcon,
    Key? key,
  }) : super(key: key);

  final String blockName;
  final double maxSliderValue;
  final int blockIcon;

  @override
  _sliderBlockState createState() => _sliderBlockState();
}

class _sliderBlockState extends State<sliderBlock> {
  double _currentSliderValue = 0;
  double? _maxSliderValue; //이것도입력받기

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
              Slider(
                activeColor: Colors.grey,
                inactiveColor: Colors.grey,
                label: _currentSliderValue.round().toString(),
                value: _currentSliderValue,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
                max: widget.maxSliderValue,
                divisions: widget.maxSliderValue.toInt(),
              ),
              Text('${_currentSliderValue.toInt()} / ${widget.maxSliderValue.toInt()}'),
            ],
          ),
        ),
      ),
    );
  }
}
