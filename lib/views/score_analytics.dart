import 'package:ai_score/constants/color_constants.dart';
import 'package:ai_score/constants/dimension_constants.dart';
import 'package:ai_score/constants/image_constants.dart';
import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/extensions/allextensions.dart';
import 'package:ai_score/helper/dialog_helper.dart';
import 'package:ai_score/helper/keyboard_helper.dart';
import 'package:ai_score/provider/score_analytics_provider.dart';
import 'package:ai_score/views/base_view.dart';
import 'package:ai_score/widgets/custom_shape.dart';
import 'package:ai_score/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/shared_pref.dart';
import '../model/category_list_model.dart';

class ScoreAnalytics extends StatefulWidget {
  const ScoreAnalytics({Key? key}) : super(key: key);

  @override
  _ScoreAnalyticsState createState() => _ScoreAnalyticsState();
}

class _ScoreAnalyticsState extends State<ScoreAnalytics> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ScoreAnalyticsProvider>(onModelReady: (provider) {
      provider.getScoreData(context, "1.1", 30);
      provider.getCategoryData();
    }, builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        appBar: KeyboardHelper.appBarWithBack(context),
        body: SizedBox(
          height: DimensionConstants.d896.h,
          width: DimensionConstants.d414.w,
          child: Column(
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
                    width: DimensionConstants.d110.w,
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
                    left: DimensionConstants.d19.w,
                    right: DimensionConstants.d200.w),
                child: Row(
                  children: <Widget>[
                    Text("name".tr()).boldText(ColorConstants.primaryColor,
                        DimensionConstants.d25.sp, TextAlign.left),
                    Text(SharedPref.prefs!
                            .getString(SharedPref.studentName)
                            .toString())
                        .boldText(ColorConstants.primaryColor,
                            DimensionConstants.d25.sp, TextAlign.left),
                  ],
                ),
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
                    Text("accountId".tr()).boldText(ColorConstants.primaryColor,
                        DimensionConstants.d25.sp, TextAlign.left),
                    Text(SharedPref.prefs!
                            .getString(SharedPref.studentId)
                            .toString())
                        .boldText(ColorConstants.primaryColor,
                            DimensionConstants.d25.sp, TextAlign.left),
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
                          menuMaxHeight: DimensionConstants.d200.h,
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
                          value: provider.categoryDropDownValue,
                          items: provider.categoryList
                              .toSet()
                              .map((CategoryList item) {
                            return DropdownMenuItem(
                              onTap: () {
                                provider.categoryDropDownValueId =
                                    item.categoryName.toString();
                                provider.getScoreData(context,
                                    item.categoryNumber.toString(), 30);
                              },
                              value: item.categoryNumber,
                              child: Text(item.categoryName.toString()),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            provider.onSelected(value);
                          },
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
              Padding(
                padding: EdgeInsets.only(
                    left: DimensionConstants.d40.w,
                    right: DimensionConstants.d40.w),
                child: provider.state == ViewState.Busy
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            ColorConstants.primaryColor))
                    : SizedBox(
                        height: DimensionConstants.d513.h,
                        width: DimensionConstants.d414.w,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: provider.itemsOfList.length,
                          itemBuilder: (BuildContext context, int index) {
                            String? seconds;
                            int minutes;
                            double remainder;
                            String focus;
                            if (provider.time[index] == 60) {
                              seconds = "01:00";
                            } else if (provider.time[index] < 10) {
                              seconds =
                                  "00:" "0" + provider.time[index].toString();
                            } else if (provider.time[index] < 60) {
                              seconds = "00:" + provider.time[index].toString();
                            } else if (provider.time[index] > 60) {
                              minutes = provider.time[index] % 60;
                              remainder = (provider.time[index] / 60);
                              focus = remainder.toStringAsPrecision(1);

                              seconds = "0" "$focus" ":" "$minutes";
                            }

                            return Container(
                                height: DimensionConstants.d55.h,
                                width: MediaQuery.of(context).size.width,

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: <Widget>[
                                    Text("${index + 1}").boldText(
                                        ColorConstants.blackColor,
                                        DimensionConstants.d14.sp,
                                        TextAlign.center),
                                    SizedBox(
                                      width: DimensionConstants.d28.w,
                                    ),
                                    Text("$seconds").boldText(
                                        ColorConstants.blackColor,
                                        DimensionConstants.d14.sp,
                                        TextAlign.center),
                                    SizedBox(
                                      width: DimensionConstants.d34.w,
                                    ),
                                    Text(provider.Category[index].toString())
                                        .boldText(
                                            ColorConstants.blackColor,
                                            DimensionConstants.d14.sp,
                                            TextAlign.center),
                                    SizedBox(
                                      width: DimensionConstants.d80.w,
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        DialogHelper.showDialogWithSingleImage(context,ImagesConstants.appIcon);

                                      },
                                      child: ImageView(
                                        path: ImagesConstants.listImage,
                                        height: DimensionConstants.d49.h,
                                        width: DimensionConstants.d49.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: DimensionConstants.d40.w,
                                    ),
                                    Text(provider.totalScore[index].toString())
                                        .boldText(
                                            ColorConstants.blackColor,
                                            DimensionConstants.d14.sp,
                                            TextAlign.center),
                                  ],
                                ));
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
