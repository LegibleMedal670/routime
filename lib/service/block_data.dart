import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/blocks/image.dart';
import 'package:untitled/models/blocks/emotion.dart';
import 'package:untitled/models/blocks/read_book.dart';
import 'package:untitled/models/blocks/units.dart';
import 'package:untitled/models/blocks/slider.dart';
import 'package:untitled/models/blocks/weight.dart';

class blockService with ChangeNotifier {
  List<Widget> blockWidgets = [
    sliderBlock(
      blockIcon: 0xe1e1,
      maxSliderValue: 8,
      blockName: 'walk',
    ),
    readBlock(
      blockName: '포테토칩이야기',
      startPage: 18,
      endPage: 200,
      blockIcon: 0xe0ef,
    ),
    unitBlock(
      unit: 'L',
      blockIcon: 0xf05a2,
      initValue: null,
      blockName: 'Water',
    ),
    imageBlock(
      blockName: '이미쥐',
      blockIcon: 0xf80d,
    ),
    weightBlock(),
    emotionBlock(
      blockIcon: 0xe3ff,
      blockName: "Today's Imotion",
    ),
  ];

  void add_slider(String blockName, double maxSliderValue, int blockIcon) {
    sliderBlock newSlider = sliderBlock(
      blockName: blockName,
      maxSliderValue: maxSliderValue,
      blockIcon: blockIcon,
    );

    blockWidgets.add(newSlider);
    notifyListeners();
  }

  void add_read(String blockName, int startPage, int endPage, int blockIcon) {
    readBlock newRead = readBlock(
      blockName: blockName,
      startPage: startPage,
      endPage: endPage,
      blockIcon: blockIcon,
    );

    blockWidgets.add(newRead);
    notifyListeners();
  }

  void add_unit(String blockName, int blockIcon, String unit,
      {double initValue = 0}) {
    unitBlock newUnit = unitBlock(
      blockName: blockName,
      blockIcon: blockIcon,
      unit: unit,
    );

    blockWidgets.add(newUnit);
    notifyListeners();
  }

  void add_image(String blockName, int blockIcon) {
    imageBlock newImage = imageBlock(
      blockName: blockName,
      blockIcon: blockIcon,
    );

    blockWidgets.add(newImage);
    notifyListeners();
  }

  void add_emotion(String blockName, int blockIcon) {
    emotionBlock newEmotion = emotionBlock(
      blockName: blockName,
      blockIcon: blockIcon,
    );

    blockWidgets.add(newEmotion);
    notifyListeners();
  }

  void add_weight(String blockName, String unit) {}
}
