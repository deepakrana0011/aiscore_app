import 'dart:io';

import 'package:ai_score/constants/image_constants.dart';
import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/helper/dialog_helper.dart';
import 'package:ai_score/model/list_model.dart';
import 'package:ai_score/provider/base_provider.dart';
import 'package:ai_score/services/FetchDataExpection.dart';
import 'package:ai_score/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

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

  Future<bool> getScoreData(
      BuildContext context, String category, int score) async {
    setState(ViewState.Busy);
    try {
      var model = await api.getScore(context, category, score);

      if (model.success) {
        return true;
      }

      return true;
    } on FetchDataException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, e.toString());
      return false;
    } on SocketException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, e.toString());

      return false;
    }
  }
}
