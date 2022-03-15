import 'package:ai_score/constants/color_constants.dart';
import 'package:ai_score/constants/dimension_constants.dart';
import 'package:ai_score/constants/image_constants.dart';
import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/extensions/allextensions.dart';
import 'package:ai_score/helper/dialog_helper.dart';
import 'package:ai_score/provider/signup_provider.dart';
import 'package:ai_score/views/base_view.dart';
import 'package:ai_score/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/decoration.dart';
import '../constants/route_constants.dart';
import '../helper/keyboard_helper.dart';
import '../widgets/custom_shape.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpProvider>(
        onModelReady: (provider) {},
        builder: (context, provider, _) {
          return Scaffold(
            body: Form(
              key: provider.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: DimensionConstants.d414.w,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(top: DimensionConstants.d1.h),
                            child: ImageView(
                              path: ImagesConstants.signUpBack,
                              height: DimensionConstants.d442.h,
                              width: DimensionConstants.d414.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const ImageView(
                            path: ImagesConstants.mapShadow,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: DimensionConstants.d120.h,
                                left: DimensionConstants.d50.w,
                                right: DimensionConstants.d25.w),
                            child: ImageView(
                              path: ImagesConstants.planeImage,
                              height: DimensionConstants.d91.h,
                              width: DimensionConstants.d316.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top: DimensionConstants.d260.h,
                              right: DimensionConstants.d20.w,
                              left: DimensionConstants.d20.w,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(DimensionConstants.d20.r),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorConstants.whiteColor,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            DimensionConstants.d20.r),
                                        topLeft: Radius.circular(
                                            DimensionConstants.d20.r),
                                        bottomRight: Radius.circular(
                                            DimensionConstants.d20.r),
                                        bottomLeft: Radius.circular(
                                            DimensionConstants.d20.r),
                                      )),
                                  height: DimensionConstants.d547.h,
                                  width: DimensionConstants.d375.w,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d44.w,
                                            right: DimensionConstants.d215.w,
                                            top: DimensionConstants.d43.h),
                                        child: Text("signUp".tr()).boldText(
                                            ColorConstants.primaryColor,
                                            DimensionConstants.d30.sp,
                                            TextAlign.left),
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d3..h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: DimensionConstants.d46.w,
                                          right: DimensionConstants.d131.w,
                                        ),
                                        child: Text("signUpToYourAccount".tr())
                                            .regularText(
                                                ColorConstants.lightGrayColor,
                                                DimensionConstants.d18.sp,
                                                TextAlign.left),
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d30.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d46.w,
                                            right: DimensionConstants.d46.w),
                                        child: Stack(children: [
                                          Material(
                                            elevation: 4.0,
                                            shadowColor: Colors.black,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  DimensionConstants.d10.r),
                                            ),
                                            child: CustomShape(
                                              bgColor:
                                                  ColorConstants.whiteColor,
                                              strokeColor:
                                                  ColorConstants.whiteColor,
                                              radius: const BorderRadius.all(
                                                  Radius.circular(
                                                      DimensionConstants.d10)),
                                              height: DimensionConstants.d51.h,
                                              width: DimensionConstants.d290.w,
                                            ),
                                          ),
                                          TextFormField(
                                            textCapitalization: TextCapitalization.sentences,

                                            controller:
                                                provider.studentNameController,
                                            decoration: ViewDecoration
                                                .inputDecorationWithCurve(
                                              "studentName".tr(),
                                              ColorConstants.lightGrayColor,
                                            ),
                                          ),
                                        ]),
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d46.w,
                                            right: DimensionConstants.d46.w),
                                        child: Stack(children: [
                                          Material(
                                            elevation: 4.0,
                                            shadowColor: Colors.black,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  DimensionConstants.d10.r),
                                            ),
                                            child: CustomShape(
                                              bgColor:
                                                  ColorConstants.whiteColor,
                                              strokeColor:
                                                  ColorConstants.whiteColor,
                                              radius: const BorderRadius.all(
                                                  Radius.circular(
                                                      DimensionConstants.d10)),
                                              height: DimensionConstants.d51.h,
                                              width: DimensionConstants.d290.w,
                                            ),
                                          ),
                                          TextFormField(
                                            controller: provider
                                                .studentNumberController,
                                            decoration: ViewDecoration
                                                .inputDecorationWithCurve(
                                              "studentNumber".tr(),
                                              ColorConstants.lightGrayColor,
                                            ),
                                          ),
                                        ]),
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d46.w,
                                            right: DimensionConstants.d46.w),
                                        child: Stack(
                                          children: <Widget>[
                                            Material(
                                              elevation: 4.0,
                                              shadowColor: Colors.black,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    DimensionConstants.d10.r),
                                              ),
                                              child: CustomShape(
                                                bgColor:
                                                    ColorConstants.whiteColor,
                                                strokeColor:
                                                    ColorConstants.whiteColor,
                                                radius: const BorderRadius.all(
                                                    Radius.circular(
                                                        DimensionConstants
                                                            .d10)),
                                                height:
                                                    DimensionConstants.d51.h,
                                                width:
                                                    DimensionConstants.d290.w,
                                              ),
                                            ),
                                            TextFormField(
                                              obscureText:
                                                  provider.isPasswordVisible,
                                              controller:
                                                  provider.passwordController,
                                              decoration: ViewDecoration
                                                  .inputDecorationWithCurvePassword(
                                                "passWord".tr(),
                                                ColorConstants.lightGrayColor,
                                              ),
                                             /* validator: (value) {
                                                if (value!.trim().isEmpty) {
                                                  return 'Empty password';
                                                } else if (value.length < 6) {
                                                  return 'Enter a password with length at least 6 letters';
                                                } else {
                                                  return null;
                                                }
                                              },*/
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: DimensionConstants
                                                      .d230.w),
                                              child: IconButton(
                                                  onPressed: () {
                                                    provider.visiblePassword();
                                                  },
                                                  icon: Icon(
                                                    provider.isPasswordVisible
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: ColorConstants
                                                        .primaryColor,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d46.w,
                                            right: DimensionConstants.d46.w),
                                        child: Stack(
                                          children: <Widget>[
                                            Material(
                                              elevation: 4.0,
                                              shadowColor: Colors.black,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    DimensionConstants.d10.r),
                                              ),
                                              child: CustomShape(
                                                bgColor:
                                                    ColorConstants.whiteColor,
                                                strokeColor:
                                                    ColorConstants.whiteColor,
                                                radius: const BorderRadius.all(
                                                    Radius.circular(
                                                        DimensionConstants
                                                            .d10)),
                                                height:
                                                    DimensionConstants.d51.h,
                                                width:
                                                    DimensionConstants.d290.w,
                                              ),
                                            ),
                                            TextFormField(
                                              obscureText:
                                                  provider.isPasswordVisible,
                                              controller: provider
                                                  .confirmPasswordController,
                                              decoration: ViewDecoration
                                                  .inputDecorationWithCurvePassword(
                                                "confirmPassword".tr(),
                                                ColorConstants.lightGrayColor,
                                              ),
                                              validator: (value) {
                                                if (provider.passwordController
                                                        .text !=
                                                    provider
                                                        .confirmPasswordController
                                                        .text) {
                                                  return 'Password not matched';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d20.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d0.w),
                                        child: provider.state == ViewState.Busy
                                            ? const CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color>(
                                                        ColorConstants
                                                            .primaryColor))
                                            : GestureDetector(
                                                onTap: () {
                                                  if (provider
                                                      .studentNumberController
                                                      .text
                                                      .isEmpty) {
                                                    DialogHelper.showMessage(
                                                        context,
                                                        "please enter Student Name ");
                                                  } else if (provider
                                                      .studentNumberController
                                                      .text
                                                      .isEmpty) {
                                                    DialogHelper.showMessage(
                                                        context,
                                                        "please enter Student number ");
                                                  } else if (provider
                                                      .passwordController
                                                      .text
                                                      .isEmpty) {
                                                    DialogHelper.showMessage(
                                                        context,
                                                        "Enter your password");
                                                  } else if (provider
                                                      .formKey.currentState!
                                                      .validate()) {
                                                    KeyboardHelper.hideKeyboard(
                                                        context);
                                                    /*provider
                                                          .studentNameController
                                                          .text
                                                          .isNotEmpty &&
                                                      provider
                                                          .studentNumberController
                                                          .text
                                                          .isNotEmpty &&
                                                      provider
                                                          .passwordController
                                                          .text
                                                          .isNotEmpty*/
                                                    provider.signUp(
                                                        context,
                                                        provider
                                                            .studentNameController
                                                            .text,
                                                        provider
                                                            .studentNumberController
                                                            .text,
                                                        provider
                                                            .passwordController
                                                            .text);
                                                  }
                                                  ;

                                                  /* if (provider.formKey.currentState!
                                              .validate()) {
                                            KeyboardHelper.hideKeyboard(
                                                context);
                                            Navigator.of(context).pushNamed(
                                                RoutesConstants.categoryScreen);
                                          }*/
                                                },
                                                child: CustomShape(
                                                  bgColor: ColorConstants
                                                      .primaryColor,
                                                  height:
                                                      DimensionConstants.d51.h,
                                                  width:
                                                      DimensionConstants.d290.w,
                                                  radius:
                                                      const BorderRadius.all(
                                                    Radius.circular(
                                                        DimensionConstants.d10),
                                                  ),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left:
                                                                DimensionConstants
                                                                    .d19.w),
                                                        child: Text(
                                                                "signUp".tr())
                                                            .regularText(
                                                                ColorConstants
                                                                    .whiteColor,
                                                                DimensionConstants
                                                                    .d20.sp,
                                                                TextAlign.left),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            DimensionConstants
                                                                .d160.w,
                                                      ),
                                                      const ImageView(
                                                        path: ImagesConstants
                                                            .arrowIcon,
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
                                          Navigator.pop(context);
                                        },
                                        child: Text("logIn".tr()).boldText(
                                            ColorConstants.textBlueColor,
                                            DimensionConstants.d16.sp,
                                            TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
