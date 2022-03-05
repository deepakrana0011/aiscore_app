import 'dart:io';

import 'package:ai_score/provider/base_provider.dart';
import 'package:ai_score/provider/save_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/route_constants.dart';
import '../enum/viewstate.dart';
import '../helper/dialog_helper.dart';
import '../helper/shared_pref.dart';
import '../locator.dart';
import '../services/FetchDataExpection.dart';
import '../services/api.dart';

class LoginProvider extends BaseProvider {
  final formKey = GlobalKey<FormState>();
  SaveToken saveToken = locator<SaveToken>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = true;

  Future<bool> login(
      BuildContext context, String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(ViewState.Busy);
    SharedPref.prefs!.setString(SharedPref.Email, email);

    try {
      var model = await api.login(context, email, password);
      if (model.success) {
        saveToken.registerToken = model.token;
        saveToken.id = model.data!.id;
        if (model.data!.status == 1) {
          SharedPref.prefs?.setString(SharedPref.TOKEN, model.token);
          SharedPref.prefs?.setString(SharedPref.USER_ID, model.data!.id);
          saveToken.checkLogin = false;
          Navigator.pushNamedAndRemoveUntil(context,
              RoutesConstants.smileScreen, (Route<dynamic> route) => false,
              arguments: true);
        } else {
          Navigator.of(context).pushNamed(RoutesConstants.categoryScreen);
        }

        setState(ViewState.Idle);
        return true;
      } else {
        DialogHelper.showMessage(context, model.message);
        setState(ViewState.Idle);
        return false;
      }
    } on FetchDataException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, c.toString());
      return false;
    } on SocketException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, 'Internet connection');
      return false;
    }
  }

  visiblePassword() {
    isPasswordVisible = !isPasswordVisible;

    notifyListeners();
  }
}
