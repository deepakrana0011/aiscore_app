import 'package:ai_score/provider/base_provider.dart';
import 'package:flutter/cupertino.dart';

class SignUpProvider extends BaseProvider {
  final studentNameController = TextEditingController();
  final studentNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;

  visiblePassword() {
    isPasswordVisible = !isPasswordVisible;

    notifyListeners();
  }
}
