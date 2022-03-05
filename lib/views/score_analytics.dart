import 'package:ai_score/constants/color_constants.dart';
import 'package:ai_score/constants/dimension_constants.dart';
import 'package:ai_score/constants/image_constants.dart';
import 'package:ai_score/extensions/allextensions.dart';
import 'package:ai_score/helper/keyboard_helper.dart';
import 'package:ai_score/provider/score_analytics_provider.dart';
import 'package:ai_score/views/base_view.dart';
import 'package:ai_score/widgets/custom_shape.dart';
import 'package:ai_score/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreAnalytics extends StatefulWidget {
  const ScoreAnalytics({Key? key}) : super(key: key);

  @override
  _ScoreAnalyticsState createState() => _ScoreAnalyticsState();
}

class _ScoreAnalyticsState extends State<ScoreAnalytics> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ScoreAnalyticsProvider>(
        onModelReady: (providr) {},
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: ColorConstants.backgroundColor,
            appBar: KeyboardHelper.appBarWithBack(context),
            body: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: DimensionConstants.d17.w,
                        top: DimensionConstants.d39.h,
                      ),
                      child: ImageView(
                        path: ImagesConstants.appIcon,
                        height: DimensionConstants.d87.h,
                        width: DimensionConstants.d97.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: DimensionConstants.d73.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: DimensionConstants.d45.h),
                      child: Text("scoreAnalytics".tr()).boldText(
                          ColorConstants.primaryColor,
                          DimensionConstants.d25.sp,
                          TextAlign.right),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: DimensionConstants.d10.h,
                      left: DimensionConstants.d20.w,
                      right: DimensionConstants.d322.w),
                  child: Text("name".tr()).boldText(ColorConstants.primaryColor,
                      DimensionConstants.d25.sp, TextAlign.left),
                ),
                SizedBox(
                  height: DimensionConstants.d2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: DimensionConstants.d19.w,
                      right: DimensionConstants.d85.w),
                  child: Row(
                    children: <Widget>[
                      Text("accountId".tr()).boldText(
                          ColorConstants.primaryColor,
                          DimensionConstants.d25.sp,
                          TextAlign.left),
                      Text("accountNumber".tr()).boldText(
                          ColorConstants.primaryColor,
                          DimensionConstants.d25.sp,
                          TextAlign.left),
                    ],
                  ),
                ),
                SizedBox(
                  height: DimensionConstants.d24.h,
                ),
                Material(
                  elevation: 4.0,
                  shadowColor: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(DimensionConstants.d10.r),
                  ),
                  child: CustomShape(
                    bgColor: ColorConstants.whiteColor,
                    height: DimensionConstants.d48.h,
                    width: DimensionConstants.d374.w,
                    radius: BorderRadius.all(
                      Radius.circular(DimensionConstants.d10.r),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: DimensionConstants.d20.w,
                          ),
                          child: Text("no".tr()).boldText(
                              ColorConstants.textGrayColor,
                              DimensionConstants.d12.sp,
                              TextAlign.left),
                        ),
                        SizedBox(
                          width: DimensionConstants.d24.w,
                        ),
                        Text("time".tr()).boldText(ColorConstants.textGrayColor,
                            DimensionConstants.d12.sp, TextAlign.left),
                        SizedBox(
                          width: DimensionConstants.d24.w,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: TextStyle(
                              color: ColorConstants.textGrayColor,
                              fontSize: DimensionConstants.d12.sp,
                            ),
                            iconEnabledColor: ColorConstants.textGrayColor,
                            iconDisabledColor: ColorConstants.textGrayColor,
                            hint: Text("Category".tr()).boldText(
                                ColorConstants.textGrayColor,
                                DimensionConstants.d12.sp,
                                TextAlign.left),
                            value: provider.selecteditem,
                            onChanged: (newValue) {
                              provider.onSelected(newValue);
                            },
                            items: provider.items.map((location) {
                              return DropdownMenuItem(
                                child: Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          width: DimensionConstants.d20.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("wrongActionPicture".tr()).boldText(
                              ColorConstants.textGrayColor,
                              DimensionConstants.d12.sp,
                              TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(
                          width: DimensionConstants.d20.w,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: TextStyle(
                              color: ColorConstants.textGrayColor,
                              fontSize: DimensionConstants.d12.sp,
                            ),
                            iconEnabledColor: ColorConstants.textGrayColor,
                            iconDisabledColor: ColorConstants.textGrayColor,
                            hint: Text("score".tr()).boldText(
                                ColorConstants.textGrayColor,
                                DimensionConstants.d12.sp,
                                TextAlign.left),
                            value: provider.selectScore,
                            onChanged: (newValue) {
                              provider.onSelectScore(newValue);
                            },
                            items: provider.score.map((scoreValue) {
                              return DropdownMenuItem(
                                child: Text(scoreValue),
                                value: scoreValue,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: provider.scoreList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: DimensionConstants.d55.h,
                        width: DimensionConstants.d374.w,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: DimensionConstants.d20.h),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: DimensionConstants.d44.w),
                                child: Text("$index").boldText(
                                    ColorConstants.blackColor,
                                    DimensionConstants.d14.sp,
                                    TextAlign.center),
                              ),
                              SizedBox(
                                width: DimensionConstants.d30.w,
                              ),
                              Text(provider.scoreList[index].time).boldText(
                                  ColorConstants.blackColor,
                                  DimensionConstants.d14.sp,
                                  TextAlign.center),
                              SizedBox(
                                width: DimensionConstants.d34.w,
                              ),
                              Text(provider.scoreList[index].category).boldText(
                                  ColorConstants.blackColor,
                                  DimensionConstants.d14.sp,
                                  TextAlign.center),
                              SizedBox(
                                width: DimensionConstants.d60.w,
                              ),
                              ImageView(
                                path: provider.scoreList[index].image,
                                height: DimensionConstants.d49.h,
                                width: DimensionConstants.d49.w,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: DimensionConstants.d60.w,
                              ),
                              Text(provider.scoreList[index].score).boldText(
                                  ColorConstants.blackColor,
                                  DimensionConstants.d14.sp,
                                  TextAlign.center),
                            ],
                          ),
                        ));
                  },
                )
              ],
            ),
          );
        });
  }
}
