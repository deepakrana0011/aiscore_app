import 'package:ai_score/constants/image_constants.dart';
import 'package:ai_score/model/list_model.dart';
import 'package:ai_score/provider/base_provider.dart';
import 'package:ai_score/widgets/image_view.dart';

class ScoreAnalyticsProvider extends BaseProvider {
  List<String> items = ['Smile', 'Bow', 'Greet'];
  List<String> score = ['10', '20', '30', '40', '50', '60'];
  List scoreList = [
    ScoreData(
        time: "2:30",
        category: "smile",
        image: ImagesConstants.listImage,
        score: "40"),
    ScoreData(
        time: "2:30",
        category: "smile",
        image: ImagesConstants.listImage,
        score: "40"),
    ScoreData(
        time: "2:30",
        category: "smile",
        image: ImagesConstants.listImage,
        score: "40"),
    ScoreData(
        time: "2:30",
        category: "smile",
        image: ImagesConstants.listImage,
        score: "40"),
    ScoreData(
        time: "2:30",
        category: "smile",
        image: ImagesConstants.listImage,
        score: "40"),
    ScoreData(
        time: "2:30",
        category: "smile",
        image: ImagesConstants.listImage,
        score: "40"),
    ScoreData(
        time: "2:30",
        category: "smile",
        image: ImagesConstants.listImage,
        score: "40"),
    ScoreData(
        time: "2:30",
        category: "smile",
        image: ImagesConstants.listImage,
        score: "40"),
  ];
  String? selectScore;

  String? selecteditem;

  onSelected(value) {
    selecteditem = value;
    notifyListeners();
  }

  onSelectScore(value) {
    selectScore = value;
    notifyListeners();
  }
}
