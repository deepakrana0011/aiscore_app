import 'dart:async';
import 'dart:io';

import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/helper/dialog_helper.dart';
import 'package:ai_score/helper/shared_pref.dart';
import 'package:ai_score/model/getlastscoer_response.dart';
import 'package:ai_score/provider/base_provider.dart';
import 'package:ai_score/services/FetchDataExpection.dart';
import 'package:camera/camera.dart';
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

  Future<void> addscore(BuildContext context, String category, int time,
      String pose, int score) async {
    try {
      var model =
          await api.addscore(context, category, time, pose, score.toString());
      if (model.success) {
        await getLastScoreData(context, category);
      } else {
        DialogHelper.showMessage(context, model.message);
      }
    } on FetchDataException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, e.toString());
    } on SocketException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, e.toString());
    }
  }

  Future<void> getLastScoreData(BuildContext context, String category,
      {bool showLoader = false}) async {
    if (showLoader) {
      setState(ViewState.Busy);
    }
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
    } on FetchDataException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, e.toString());
    } on SocketException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, e.toString());
    }
  }

  bool updateVideo = false;

  updateUploadVideo(bool val) {
    updateVideo = val;
    notifyListeners();
  }

  Future<void> uploadVideo(BuildContext context, XFile videoFile,
      String categoryId, int time) async {
    setState(ViewState.Busy);
    try {
      var model = await api.uploadVideo(videoFile);
      if (model.success == true) {
        poseCompare(context, model.data!, categoryId, time);
      } else {
        DialogHelper.showMessage(context, model.message);
      }
    } on FetchDataException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, c.toString());
    } on SocketException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, 'internet_connection'.tr());
    }
  }

  Future<void> poseCompare(
      BuildContext context, String videoUrl, String scoreId, int time) async {
    try {
      var model = await api.poseCompare(scoreId, videoUrl);
      if (model.status == true) {
        await addscore(context, scoreId, time, model.data!.badPoses!,
            model.data!.scores![0]);
      } else {
        DialogHelper.showMessage(context, "oops something went wrong");
      }
    } on FetchDataException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, c.toString());
    } on SocketException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, 'internet_connection'.tr());
    }
  }

  void updateSelectedState(int state) {
    selectedToggle = state;
    notifyListeners();
  }
}
