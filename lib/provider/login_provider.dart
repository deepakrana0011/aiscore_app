import 'dart:io';

import 'package:ai_score/provider/base_provider.dart';
import 'package:ai_score/helper/save_token.dart';
import 'package:flutter/cupertino.dart';

import '../constants/route_constants.dart';
import '../enum/viewstate.dart';
import '../helper/dialog_helper.dart';
import '../helper/shared_pref.dart';
import '../locator.dart';
import '../services/FetchDataExpection.dart';

class LoginProvider extends BaseProvider {
  final formKey = GlobalKey<FormState>();
  SaveToken saveToken = locator<SaveToken>();
  String? studentName;

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = true;

  Future<bool> login(
      BuildContext context, String username, String password) async {
    setState(ViewState.Busy);
    SharedPref.prefs!.setString(SharedPref.USERNAME, username);

    try {
      var model = await api.login(context, username, password);

      if (model.success) {
        saveToken.registerToken = model.data!.token;
        saveToken.id = model.data!.id;
        if (model.data!.status == 1) {
          SharedPref.prefs?.setString(SharedPref.TOKEN, model.data!.token);
          SharedPref.prefs?.setString(SharedPref.ID, model.data!.id);
          SharedPref.prefs
              ?.setString(SharedPref.studentName, model.data!.studentName);
          SharedPref.prefs
              ?.setString(SharedPref.studentId, model.data!.studentNo);

          saveToken.checkLogin = false;
          Navigator.pushNamedAndRemoveUntil(context,
              RoutesConstants.categoryScreen, (Route<dynamic> route) => false,
              arguments: true);
        }

      } else {
        DialogHelper.showMessage(context, model.message);
        setState(ViewState.Idle);
        return true;
      }
      return true;
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
