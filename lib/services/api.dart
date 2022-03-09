import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ai_score/model/signup_response.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';

import '../constants/api_constants.dart';
import '../helper/shared_pref.dart';
import '../locator.dart';
import '../model/addscore_response.dart';
import '../model/getlastscoer_response.dart';
import '../model/getscore_response.dart';
import '../model/login_response.dart';
import '../provider/save_token.dart';
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
        var errorMessage = errorData["error"];
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
        var errorMeaasge = errorData["error"];
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
        var errorMessage = errorData["error"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }

  Future<GetScore> getScore(
      BuildContext context, String category, int score) async {
    try {
      dio.options.headers["Authorization"] = "Bearer " + SharedPref.prefs!.getString(SharedPref.TOKEN).toString();

      var map = {"category": category, "score": score};
      var id = SharedPref.prefs?.getString(SharedPref.ID);

      var response = await dio.get(ApiConstants.BASEURL+ ApiConstants.GETSTUDENTID +id! +ApiConstants.GETSCORE, queryParameters: map,
      );
      return GetScore.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = json.decode(e.response.toString());
        var errorMessage = errorData["error"];
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
        var errorMessage = errorData["error"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }




}
