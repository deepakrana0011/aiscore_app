import 'dart:io';

import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/helper/dialog_helper.dart';
import 'package:ai_score/model/getscore_response.dart';
import 'package:ai_score/provider/base_provider.dart';
import 'package:ai_score/services/FetchDataExpection.dart';
import 'package:flutter/cupertino.dart';

import '../json/category_list.dart';
import '../model/category_list_model.dart';

class ScoreAnalyticsProvider extends BaseProvider {
  List<CategoryList> categoryList = [];
  List<GetScoreData> itemsOfList = [];
  String categoryDropDownValue = "";
  String? categoryDropDownValueId;


  bool tap = true;
  changeTap() {
    tap = !tap;
    notifyListeners();
  }

  String? listName;

  getCategoryName(String name) {
    listName = name;
    notifyListeners();
  }

  void sortList(){

    if (tap == false) {
      itemsOfList.sort((a, b) =>
          a.totalScore.compareTo(b.totalScore));
    } else if (tap == true) {
      itemsOfList.sort((a, b) =>
          b.totalScore.compareTo(a.totalScore));
    }



  }

  getCategoryData() {
    var response = CategoryListModel.fromJson(categoryData);
    categoryList.addAll(response.categoryList);
    categoryDropDownValue = categoryList[0].categoryNumber!;
  }

  String? selectScore;

  onSelected(value) {
    categoryDropDownValue = value;
    notifyListeners();
  }

  onSelectScore(value) {
    selectScore = value;
    notifyListeners();
  }

  Future<bool> getScoreData(BuildContext context, String category, String score) async {
    setState(ViewState.Busy);
    try {
      var model = await api.getScore(context, category, score);

      if (model.success) {
        itemsOfList = model.data;
      }
      setState(ViewState.Idle);
      return false;
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
