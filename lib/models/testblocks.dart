import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestBlock extends StatelessWidget {
  final String blockName;
  final String imgPath;
  final bool powerON;
  void Function(bool)? onChanged;

  TestBlock({
    Key? key,
    required this.blockName,
    required this.imgPath,
    required this.powerON,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: powerON ? Colors.grey[900] : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            children: [
              Image.asset(
                imgPath,
                height: 65,
              ),
              const SizedBox(height: 30.0,),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        blockName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: powerON ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerON,
                      onChanged: onChanged,
                    ),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
