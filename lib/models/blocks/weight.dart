import 'package:flutter/material.dart';

class weightBlock extends StatefulWidget {
  const weightBlock({Key? key}) : super(key: key);

  @override
  _sliderBlockState createState() => _sliderBlockState();
}

class _sliderBlockState extends State<weightBlock> {
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
                    Icons.fitness_center,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Weight',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('500kg',style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
