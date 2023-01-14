import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imageBlock extends StatefulWidget {
  const imageBlock({Key? key}) : super(key: key);

  @override
  _imageBlockState createState() => _imageBlockState();
}

class _imageBlockState extends State<imageBlock> {
  File? _image;
  final picker = ImagePicker();
  //bool isImage = false;

  Future getImage(ImageSource ImageSource) async {
    final image = await picker.pickImage(source : ImageSource);

    setState(() {
      _image = File(image!.path);
    });
  }


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
          height: 212,
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
                    Icons.rocket_launch,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Today's Image" ,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: (){
                  getImage(ImageSource.gallery);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: _image == null
                   ? Colors.grey[400]
                   : Colors.transparent,
                  height: 150,
                  width: 150,
                  child:
                    _image == null
                  ? Text('image')
                  : Image.file(File(_image!.path), width: 150, height: 150,)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
