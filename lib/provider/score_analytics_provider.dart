import 'dart:io';

import 'package:ai_score/constants/image_constants.dart';
import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/helper/dialog_helper.dart';
import 'package:ai_score/model/getscore_response.dart';
import 'package:ai_score/model/list_model.dart';
import 'package:ai_score/provider/base_provider.dart';
import 'package:ai_score/services/FetchDataExpection.dart';
import 'package:ai_score/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../json/category_list.dart';
import '../model/category_list_model.dart';

class ScoreAnalyticsProvider extends BaseProvider {
  List<CategoryList> categoryList = [];
  List<String> score = ['10', '20', '30', '40', '50', '60'];
  List<GetScoreData> itemsOfList = [];
  String categoryDropDownValue = "";
  String? categoryDropDownValueId;
  List id = [];
  List studentId = [];
  List time = [];
  List totalScore = [];
  List Category = [];

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

  Future<bool> getScoreData(
      BuildContext context, String category, int score) async {
    setState(ViewState.Busy);
    try {
      var model = await api.getScore(context, category, score);

      if (model.success) {
        itemsOfList = model.data;
        for (var element in itemsOfList) {
          id.add(element.id);
          studentId.add(element.studentId);
          time.add(element.time);
          totalScore.add(element.totalScore);
          Category.add(element.category);
        }
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
