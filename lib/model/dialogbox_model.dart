import '../constants/image_constants.dart';

class ModelList {
  String? title;
  int? number;
  String? image;
  String? imageSecond;
  ModelList({this.title, this.number, this.image, this.imageSecond});
}

List<ModelList> choices = <ModelList>[
  ModelList(
      title: 'Distance Score',
      number: 20,
      image: ImagesConstants.festival,
      imageSecond: ImagesConstants.festival),
];
