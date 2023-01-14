import 'package:flutter/material.dart';

class checkListBlock extends StatelessWidget {
  final String blockName;
  void Function(bool?)? checkBoxBool;
  final bool? checkboxState;

  checkListBlock({
    Key? key,
    required this.blockName,
    required this.checkBoxBool,
    required this.checkboxState,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(blockName, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0
          ),),
          Checkbox(value: checkboxState, onChanged: checkBoxBool)
        ],
      ),
    );
  }
}
