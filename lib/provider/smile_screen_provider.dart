import 'dart:async';
import 'dart:io';

import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/helper/dialog_helper.dart';
import 'package:ai_score/helper/shared_pref.dart';
import 'package:ai_score/model/getlastscoer_response.dart';
import 'package:ai_score/provider/base_provider.dart';
import 'package:ai_score/services/FetchDataExpection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/shared_pref.dart';
import '../json/category_list.dart';
import '../model/category_list_model.dart';
import '../model/getlastscoer_response.dart';

class SmileScreenProvider extends BaseProvider {
  List<ScoresList> totalScores = [];
  List totalScoreGet = [];
  int? round;
  int selectedToggle = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// declare a cound variable with initial value
  int secondsCount = 0;

  int minuteCount = 0;

  /// declare a timer
  Timer? timer;

  bool data = false;

  updateData(bool val) {
    data = val;
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> addscore(BuildContext context, String category, int time) async {
    setState(ViewState.Busy);

    try {
      var model = await api.addscore(context, category, time);

      if (model.success) {
        DialogHelper.showMessage(context, model.message);
        setState(ViewState.Idle);
      }
    } on FetchDataException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, e.toString());
    } on SocketException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, e.toString());
    }
  }

  Future<bool> getScoreData(BuildContext context, String category) async {
    setState(ViewState.Busy);
    try {
      var model = await api.getLastScores(
        context,
        category,
      );

      if (model.success) {
        round = model.data!.round;

        totalScores = model.data!.scores;
        for (var element in totalScores) {
          totalScoreGet.add(element.totalScore);
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

  void updateSelectedState(int state) {
    selectedToggle = state;
    notifyListeners();
  }
}
