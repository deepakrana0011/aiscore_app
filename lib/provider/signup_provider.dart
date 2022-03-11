import 'dart:io';

import 'package:ai_score/constants/route_constants.dart';
import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/helper/dialog_helper.dart';
import 'package:ai_score/provider/base_provider.dart';
import 'package:ai_score/helper/save_token.dart';
import 'package:ai_score/services/FetchDataExpection.dart';

import 'package:flutter/cupertino.dart';

import '../helper/shared_pref.dart';
import '../locator.dart';

class SignUpProvider extends BaseProvider {
  final studentNameController = TextEditingController();
  final studentNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  SaveToken saveToken = locator<SaveToken>();

  bool isPasswordVisible = true;

  visiblePassword() {
    isPasswordVisible = !isPasswordVisible;

    notifyListeners();
  }

  Future<bool> signUp(BuildContext context, String studentName,
      String studentNo, String password) async {
    setState(ViewState.Busy);
    SharedPref.prefs!.setString(SharedPref.USERNAME, studentNo);

    try {
      var model = await api.signUp(context, studentName, studentNo, password);
      if (model.success) {
        saveToken.registerToken = model.data!.id;
        SharedPref.prefs!.setString(SharedPref.ID, model.data!.id);
        saveToken.id = model.data!.id;
        saveToken.checkLogin = false;
        if (model.data!.status == 1) {
          SharedPref.prefs!.setString(SharedPref.studentName, model.data!.studentName);
          SharedPref.prefs!.setString(SharedPref.studentId, model.data!.studentNo);



          Navigator.pushNamedAndRemoveUntil(context,
              RoutesConstants.categoryScreen, (Route<dynamic> route) => false,
              arguments: true);
        }
        return false;
      } else {
        setState(ViewState.Idle);
        DialogHelper.showMessage(context, model.message);
        return true;
      }
      return true;
    } on FetchDataException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, e.toString());

      return false;
    } on SocketException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, "Internet Connection");
      return false;
    }
  }
}
