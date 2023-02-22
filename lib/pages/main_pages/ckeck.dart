import 'package:flutter/material.dart';
import 'package:untitled/models/checkList.dart';
import 'package:untitled/models/testblocks.dart';

class checkPage extends StatefulWidget {
  const checkPage({Key? key}) : super(key: key);

  @override
  _checkPageState createState() => _checkPageState();
}

class _checkPageState extends State<checkPage> {

  List gridViewTest = [
    ['bee', "lib/img/bee.jpg", true],
    ['chicken', "lib/img/chicken.jpg", true],
    ['creeper', "lib/img/creeper.jpg", false],
    ['pig', "lib/img/pig.jpg", true],
    ['pumpkin', "lib/img/pumpkin.jpg", false],
    ['sheep', "lib/img/sheep.jpg", true],
    ['steve', "lib/img/steve.jpg", true],
  ];

  bool exerciseOpen = true;
  bool isChecked = false;

  void checkBoxChanged(bool? checkboxState){
    setState(() {
      isChecked = checkboxState ?? true;
    });
  }

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      gridViewTest[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeIn,
              height: exerciseOpen ? 482 : 90 ,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Exercise',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              exerciseOpen = !exerciseOpen;
                            });
                          },
                          icon: Icon( exerciseOpen ? Icons.unfold_less : Icons.unfold_more)),
                    ],
                  ),
                  Expanded(
                    child:GridView.builder(
                        itemCount: gridViewTest.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.18,
                        ),
                        itemBuilder: (context, index) {
                          return TestBlock(
                            blockName: gridViewTest[index][0],
                            imgPath: gridViewTest[index][1],
                            powerON: gridViewTest[index][2],
                            onChanged: (value) =>
                                powerSwitchChanged(value, index),
                          );
                        }) ,),
                ],
              ),
            ),
            checkListBlock(blockName: 'Eat Protein', checkBoxBool: checkBoxChanged, checkboxState: isChecked,),
            SizedBox(height: 15.0,),
            checkListBlock(blockName: 'Mom\'s Touch', checkBoxBool: checkBoxChanged, checkboxState: isChecked,),

          ],
        ),
      ),
    );
  }
}
