import 'package:ai_score/constants/dimension_constants.dart';
import 'package:ai_score/constants/image_constants.dart';
import 'package:ai_score/extensions/allextensions.dart';
import 'package:ai_score/provider/login_provider.dart';
import 'package:ai_score/views/base_view.dart';
import 'package:ai_score/widgets/custom_shape.dart';
import 'package:ai_score/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';
import '../constants/decoration.dart';
import '../constants/route_constants.dart';
import '../constants/validations.dart';
import '../enum/viewstate.dart';
import '../helper/dialog_helper.dart';
import '../helper/keyboard_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      onModelReady: (provider) {},
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: ColorConstants.whiteColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: DimensionConstants.d480.h,
                        width: DimensionConstants.d414.w,
                        child: Stack(
                          children: <Widget>[
                            const ImageView(
                              path: ImagesConstants.smokeLines,
                            ),
                            Positioned(
                              top: DimensionConstants.d31.h,
                              left: DimensionConstants.d86.w,
                              right: DimensionConstants.d79.w,
                              child: Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      DimensionConstants.d124.r),
                                  child: ImageView(
                                      path: ImagesConstants.seaWave,
                                      height: DimensionConstants.d442.h,
                                      width: DimensionConstants.d248.w),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: DimensionConstants.d44.h,
                                      left: DimensionConstants.d76.w),
                                  child: const ImageView(
                                    path: ImagesConstants.appIcon,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: DimensionConstants.d150.h,
                                      left: DimensionConstants.d21.w),
                                  child: ImageView(
                                    path: ImagesConstants.planeImage,
                                    width: DimensionConstants.d212.w,
                                    height: DimensionConstants.d61.h,
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: DimensionConstants.d242.w,
                            left: DimensionConstants.d70.w),
                        child: Text("logIn".tr()).boldText(
                            ColorConstants.primaryColor,
                            DimensionConstants.d30.sp,
                            TextAlign.left),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: DimensionConstants.d138.w,
                            left: DimensionConstants.d65.w),
                        child: Text("logInToYourAccount".tr()).regularText(
                            ColorConstants.lightGrayColor,
                            DimensionConstants.d18.sp,
                            TextAlign.left),
                      ),
                      SizedBox(
                        height: DimensionConstants.d31.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: DimensionConstants.d62.w,
                            right: DimensionConstants.d62.w),
                        child: Stack(
                          children: <Widget>[
                            Material(
                              elevation: 4.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(DimensionConstants.d10.r),
                              ),
                              child: CustomShape(
                                bgColor: ColorConstants.whiteColor,
                                strokeColor: ColorConstants.whiteColor,
                                radius: const BorderRadius.all(
                                    Radius.circular(DimensionConstants.d10)),
                                height: DimensionConstants.d51.h,
                                width: DimensionConstants.d290.w,
                              ),
                            ),
                            TextFormField(
                              controller: provider.userNameController,
                              decoration:
                                  ViewDecoration.inputDecorationWithCurve(
                                "userName".tr(),
                                ColorConstants.lightGrayColor,
                              ),
                              /* validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Empty email';
                                } else if (!Validations.emailValidation(
                                    value)) {
                                  return 'Invalid email';
                                } else {
                                  return null;
                                }
                              },*/
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d9.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: DimensionConstants.d62.w,
                            right: DimensionConstants.d62.w),
                        child: Stack(
                          children: <Widget>[
                            Material(
                              elevation: 4.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(DimensionConstants.d10.r),
                              ),
                              child: CustomShape(
                                bgColor: ColorConstants.whiteColor,
                                strokeColor: ColorConstants.whiteColor,
                                radius: const BorderRadius.all(
                                    Radius.circular(DimensionConstants.d10)),
                                height: DimensionConstants.d51.h,
                                width: DimensionConstants.d290.w,
                              ),
                            ),
                            TextFormField(
                              obscureText: provider.isPasswordVisible,
                              controller: provider.passwordController,
                              decoration: ViewDecoration
                                  .inputDecorationWithCurvePassword(
                                "passWord".tr(),
                                ColorConstants.lightGrayColor,
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Empty password';
                                } else if (value.length < 6) {
                                  return 'Enter a password with length at least 6 letters';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: DimensionConstants.d230.w,
                                right: DimensionConstants.d10.w,
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    provider.visiblePassword();
                                  },
                                  icon: Icon(
                                    provider.isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: ColorConstants.primaryColor,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d22.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: DimensionConstants.d0.w),
                        child: provider.state == ViewState.Busy
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    ColorConstants.primaryColor))
                            : GestureDetector(
                                onTap: () {
                                  if (provider
                                      .userNameController.text.isEmpty) {
                                    DialogHelper.showMessage(
                                        context, 'Please enter username');
                                  } else if (provider
                                      .passwordController.text.isEmpty) {
                                    DialogHelper.showMessage(
                                        context, 'Please enter your password');
                                  } else if (provider.formKey.currentState!
                                          .validate()

                                      /*provider
                                          .userNameController.text.isNotEmpty &&
                                      provider
                                          .passwordController.text.isNotEmpty*/
                                      ) {
                                    KeyboardHelper.hideKeyboard(context);
                                    provider
                                        .login(
                                            context,
                                            provider.userNameController.text,
                                            provider.passwordController.text)
                                        .then((value) {
                                      if (value) {}
                                    });
                                  }

                                  /* if (provider.formKey.currentState!.validate()) {
                            KeyboardHelper.hideKeyboard(context);

                          }*/
                                },
                                child: CustomShape(
                                  bgColor: ColorConstants.primaryColor,
                                  height: DimensionConstants.d51.h,
                                  width: DimensionConstants.d290.w,
                                  radius: const BorderRadius.all(
                                    Radius.circular(DimensionConstants.d10),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d19.w),
                                        child: Text("logIn".tr()).regularText(
                                            ColorConstants.whiteColor,
                                            DimensionConstants.d20.sp,
                                            TextAlign.left),
                                      ),
                                      SizedBox(
                                        width: DimensionConstants.d170.w,
                                      ),
                                      const ImageView(
                                        path: ImagesConstants.arrowIcon,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d10.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RoutesConstants.signUpScreen);
                        },
                        child: Text("signUp".tr()).boldText(
                            ColorConstants.textBlueColor,
                            DimensionConstants.d16.sp,
                            TextAlign.center),
                      ),
                      SizedBox(
                        height: DimensionConstants.d30.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
