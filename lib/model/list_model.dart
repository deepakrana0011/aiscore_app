import 'dart:io';

import 'package:flutter/cupertino.dart';

class ScoreData {
  String? time;
  String? category;
  String? image;

  String? score;

  ScoreData({this.time, this.category, this.image, this.score});
}

class ImageData {
  String? image;
  ImageData({this.image});
}
