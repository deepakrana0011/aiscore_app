import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/model/signup_response.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';

import '../constants/api_constants.dart';
import '../helper/shared_pref.dart';
import '../locator.dart';
import '../model/addscore_response.dart';
import '../model/getlastscoer_response.dart';
import '../model/getscore_response.dart';
import '../model/login_response.dart';
import '../helper/save_token.dart';
import '../model/video_upload_response.dart';
import 'FetchDataExpection.dart';

class Api {
  Dio dio = locator<Dio>();
  SaveToken saveToken = locator<SaveToken>();
  Future<LoginResponse> login(
      BuildContext context, String username, String password) async {
    try {
      var map = {"studentNo": username, "password": password};
      var response =
          await dio.post(ApiConstants.BASEURL + ApiConstants.LOGIN, data: map);
      return LoginResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException(" ");
      }
    }
  }

  Future<SignUpResponse> signUp(BuildContext context, String studentName,
      String studentNo, String password) async {
    try {
      var map = {
        "studentName": studentName,
        "studentNo": studentNo,
        "password": password
      };

      var response = await dio
          .post(ApiConstants.BASEURL + ApiConstants.REGISTER, data: map);
      return SignUpResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMeaasge = errorData["message"];
        throw FetchDataException(errorMeaasge);
      } else {
        throw const SocketException("");
      }
    }
  }

  Future<AddScoreResponse> addscore(
      BuildContext context, String category, int time) async {
    try {


      dio.options.headers["Authorization"] =
          "Bearer " + SharedPref.prefs!.getString(SharedPref.TOKEN).toString();
      var map = {
        "studentId": SharedPref.prefs!.getString(SharedPref.ID),
        "category": category,
        "time": time
      };

      var response = await dio
          .post(ApiConstants.BASEURL + ApiConstants.ADDSCORE, data: map);
      return AddScoreResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }

  Future<GetScore> getScore(
      BuildContext context, String category, String score) async {
    try {
      dio.options.headers["Authorization"] = "Bearer " + SharedPref.prefs!.getString(SharedPref.TOKEN).toString();

      var map = {"category": category, "score": score};
      var id = SharedPref.prefs?.getString(SharedPref.ID);

      var response = await dio.get(ApiConstants.BASEURL+ ApiConstants.GETSTUDENTID +id!, queryParameters: map,
      );
      return GetScore.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = json.decode(e.response.toString());
        var errorMessage = errorData["message"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }

  Future<GetLastScoreResponse> getLastScores(

      BuildContext context, String category) async {
    try {
      dio.options.headers["Authorization"] = "Bearer " + SharedPref.prefs!.getString(SharedPref.TOKEN).toString();

      var map = {"category": category};
      var id = SharedPref.prefs?.getString(SharedPref.ID);

      var response = await dio.get(ApiConstants.BASEURL+ApiConstants.LASTSCORE+id!, queryParameters: map);
      return GetLastScoreResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = json.decode(e.response.toString());
        var errorMessage = errorData["message"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }


  Future<UploadVideoResponse> uploadVideo( XFile video) async {
    try {
      Uint8List bytes = await video.readAsBytes();
      dio.options.headers["Authorization"] = "Bearer " + SharedPref.prefs!.getString(SharedPref.TOKEN).toString();
      var videoDocument = MultipartFile.fromBytes(bytes, filename: "aiVideo.mp4");
      var videoMap = {"video" : videoDocument};
      var response = await dio.post(ApiConstants.BASEURL + ApiConstants.UPLOADVIDEO, data: FormData.fromMap(videoMap));
      return UploadVideoResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["error"];
        throw FetchDataException(errorMessage);
      } else {
        throw const SocketException("");
      }
    }
  }




}
