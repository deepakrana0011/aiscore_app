import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const TOKEN = "token";
  static const USERNAME = "username";
  static const ID = "id";
  static const studentName = "nameOfStudnet";
  static const studentId = "studentId";

  static SharedPreferences? prefs;

  static clearSharePref() async {
    prefs?.remove(USERNAME);
    prefs?.remove(TOKEN);
    prefs?.remove(ID);
    prefs?.remove(studentName);
    prefs?.remove(studentId);

    /*   prefs?.setString(FIRST_NAME, null);
    prefs?.setString(USER_ID, null);
    prefs?.setString(profile_pic, null);
    prefs?.setString(LAST_NAME, null);
    prefs?.setString(AGE, null);
    prefs?.setString(DESCRIPTION, null);*/
  }
}
