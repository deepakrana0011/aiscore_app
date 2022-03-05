import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../constants/api_constants.dart';
import '../locator.dart';
import '../model/login_response.dart';
import '../provider/save_token.dart';
import 'FetchDataExpection.dart';

class Api {

  Dio dio = locator<Dio>();
  SaveToken saveToken = locator<SaveToken>();
  Future<LoginResponse> login(
      BuildContext context, String email, String password) async {
    try {
      var map = {"email": email, "password": password};
      var response =
          await dio.post(ApiConstants.BASE_URL + ApiConstants.LOGIN, data: map);
      return LoginResponse.fromJson(json.decode(response.toString()));
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
}
