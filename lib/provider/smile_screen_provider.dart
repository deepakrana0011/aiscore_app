import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/helper/dialog_helper.dart';
import 'package:ai_score/model/dialogbox_model.dart';
import 'package:ai_score/model/getlastscoer_response.dart';
import 'package:ai_score/provider/base_provider.dart';
import 'package:ai_score/services/FetchDataExpection.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_compress/video_compress.dart';

import '../model/getlastscoer_response.dart';

class SmileScreenProvider extends BaseProvider {
  AudioPlayer audioPlayer = AudioPlayer();
  List<ScoresList> totalScores = [];
  int? round;
  int selectedToggle = 0;
  XFile? videoFileAfterCompress;


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


  startPlayer() async {
    ByteData bytes = await rootBundle.load("audios/clientAudio.mp3"); //load sound from assets
    Uint8List  soundBytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
     await audioPlayer.playBytes(soundBytes,volume: 10.0);
  }
  stopPlayer() async{


    await audioPlayer.stop();

  }





  Future<void> addScoreVideo(BuildContext context, String category, int time, String pose, double score) async {
    setState(ViewState.Busy);
    try {
      var model = await api.addScoreVideo(
          context, category, time, pose, score.toString());
      if (model.success) {
        setState(ViewState.Busy);
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

  Future<void> getLastScoreData(BuildContext context, String category,) async {
    setState(ViewState.Busy);
    try {
      var model = await api.getLastScores(
        context,
        category,
      );
      if (model.success) {
        round = model.data!.round;
        totalScores = model.data!.scores ;

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

  Future<void> poseCompare(BuildContext context, String videoUrl, String scoreId, int time) async {
    try {
      var model = await api.poseCompare(scoreId, videoUrl);
      if (model.status == true) {
        await addScoreVideo(context, scoreId, time, model.data!.badPoses!,model.data!.scores![0]);
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
  bool imageOnCamera = false;

  void updateSelectedState(int state) {
    selectedToggle = state;
    imageOnCamera = true;
    notifyListeners();
  }


  Future VideoCompressor(path)async{

     MediaInfo? mediaInfo =    await VideoCompress.compressVideo(path, quality: VideoQuality.LowQuality);





  }












}
