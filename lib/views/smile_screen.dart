import 'package:ai_score/constants/color_constants.dart';
import 'package:ai_score/constants/dimension_constants.dart';
import 'package:ai_score/extensions/allextensions.dart';
import 'package:ai_score/provider/smile_screen_provider.dart';
import 'package:ai_score/views/base_view.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../helper/keyboard_helper.dart';
import '../main.dart';

class SmileScreen extends StatefulWidget {
  const SmileScreen({Key? key}) : super(key: key);

  @override
  _SmileScreenState createState() => _SmileScreenState();
}

class _SmileScreenState extends State<SmileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SmileScreenProvider>(
      onModelReady: (provider) {},
      builder: (context, provider, _) {
        return Scaffold(
          appBar: KeyboardHelper.appBarWithBackTitle(context, "Smile"),
          body: Center(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    ClipPath(
                      clipper: ProsteBezierCurve(
                        position: ClipPosition.bottom,
                        list: [
                          BezierCurveSection(
                            start: const Offset(90, 10),
                            top: const Offset(414 / 2, 30),
                            end: const Offset(414, 0),
                          ),
                        ],
                      ),
                      child: Container(
                        height: 30,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: DimensionConstants.d13.h,
                ),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(DimensionConstants.d10.r),
                  child: Container(
                      height: DimensionConstants.d634.h,
                      width: DimensionConstants.d374.w,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(DimensionConstants.d10.r),
                        color: ColorConstants.whiteColor,
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: DimensionConstants.d20.h,
                                left: DimensionConstants.d13.w,
                                right: DimensionConstants.d13.w),
                            child: Container(
                              height: DimensionConstants.d523.h,
                              width: DimensionConstants.d348.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    DimensionConstants.d15.r),
                                color: ColorConstants.videoBackGround,
                              ),
                              child: CameraPreview(provider.controller!),
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          Container(
                            height: DimensionConstants.d52.h,
                            width: DimensionConstants.d285.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  DimensionConstants.d10.r),
                              color: ColorConstants.videoBackGround,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: DimensionConstants.d5.h,
                                  bottom: DimensionConstants.d5.h,
                                  left: DimensionConstants.d5.w,
                                  right: DimensionConstants.d5.w),
                              child: ToggleSwitch(
                                minWidth: 119.0,
                                cornerRadius: DimensionConstants.d10.r,
                                activeBgColors: const [
                                  [ColorConstants.primaryColor],
                                  [ColorConstants.colorOfButton]
                                ],
                                activeFgColor: Colors.white,
                                inactiveBgColor: ColorConstants.inActiveColor,
                                inactiveFgColor: Colors.white,
                                initialLabelIndex: 1,
                                totalSwitches: 2,
                                labels: ["Start", "Stop"],
                                radiusStyle: true,
                                onToggle: (index) {
                                  if (index == 0) {}
                                },
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                Container(
                  height: DimensionConstants.d82.h,
                  width: DimensionConstants.d414.w,
                  color: ColorConstants.primaryColor,
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: DimensionConstants.d20.w,
                                top: DimensionConstants.d7.h),
                            child: Text("round".tr()).boldText(
                                ColorConstants.whiteColor,
                                DimensionConstants.d20.sp,
                                TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: DimensionConstants.d20.w,
                                top: DimensionConstants.d2.h),
                            child: Text("4").boldText(ColorConstants.whiteColor,
                                DimensionConstants.d20.sp, TextAlign.center),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d17.h,
                              left: DimensionConstants.d28.w,
                              bottom: DimensionConstants.d39.h),
                          child: Text("02 : 11 : 24").boldText(
                              ColorConstants.whiteColor,
                              DimensionConstants.d20.sp,
                              TextAlign.center)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d17.h,
                              left: DimensionConstants.d28.w,
                              bottom: DimensionConstants.d43.h),
                          child: Text("34").boldText(ColorConstants.whiteColor,
                              DimensionConstants.d20.sp, TextAlign.center)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d17.h,
                              left: DimensionConstants.d28.w,
                              bottom: DimensionConstants.d43.h),
                          child: Text("10").boldText(ColorConstants.whiteColor,
                              DimensionConstants.d20.sp, TextAlign.center)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d17.h,
                              left: DimensionConstants.d28.w,
                              bottom: DimensionConstants.d43.h),
                          child: Text("10").boldText(ColorConstants.whiteColor,
                              DimensionConstants.d20.sp, TextAlign.center)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
