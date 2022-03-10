import 'package:ai_score/constants/color_constants.dart';
import 'package:ai_score/constants/dimension_constants.dart';
import 'package:ai_score/constants/image_constants.dart';
import 'package:ai_score/constants/route_constants.dart';
import 'package:ai_score/extensions/allextensions.dart';
import 'package:ai_score/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/dialog_helper.dart';
import '../helper/shared_pref.dart';
import '../widgets/custom_shape.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ImageView(
            path: ImagesConstants.seaWave,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: DimensionConstants.d68.h,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: DimensionConstants.d348.w),
                  child: GestureDetector(
                    onTap: () {
                      _signOut();
                    },
                    child: const ImageView(
                      path: ImagesConstants.signOut,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: DimensionConstants.d19.w,
                      right: DimensionConstants.d348.w),
                  child: ImageView(
                    path: ImagesConstants.appIcon,
                    height: DimensionConstants.d80.h,
                    width: DimensionConstants.d72.w,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: DimensionConstants.d19.w,
                    right: DimensionConstants.d260.w
                  ),
                  child: Row(

                    children:<Widget> [
                      Text("name".tr()).boldText(ColorConstants.primaryColor,
                          DimensionConstants.d25.sp, TextAlign.left),
                      Text(SharedPref.prefs!.getString(SharedPref.studentName).toString()).boldText(ColorConstants.primaryColor,
                          DimensionConstants.d25.sp, TextAlign.left),


                    ],
                  ),
                ),
                /*Padding(
                  padding: EdgeInsets.only(
                      top: DimensionConstants.d19.h,
                ),*/
                Padding(
                  padding: EdgeInsets.only(
                      left: DimensionConstants.d19.w,
                      right: DimensionConstants.d200.w),
                  child: Row(
                    children: <Widget>[
                      Text("accountId".tr()).boldText(
                          ColorConstants.primaryColor,
                          DimensionConstants.d25.sp,
                          TextAlign.left),
                      Text(SharedPref.prefs!.getString(SharedPref.studentId).toString()).boldText(
                          ColorConstants.primaryColor,
                          DimensionConstants.d25.sp,
                          TextAlign.left),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutesConstants.scoreAnalytics);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: DimensionConstants.d20.h,
                        left: DimensionConstants.d20.w,
                        right: DimensionConstants.d125.w),
                    child: Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(DimensionConstants.d40.r),
                      ),
                      child: CustomShape(
                        bgColor: ColorConstants.whiteColor,
                        height: DimensionConstants.d51.h,
                        width: DimensionConstants.d263.w,
                        radius: BorderRadius.all(
                          Radius.circular(DimensionConstants.d40.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d14.h,
                              left: DimensionConstants.d20.w,
                              bottom: DimensionConstants.d13.h,
                              right: DimensionConstants.d76.w),
                          child: Text("scoreAnalytics".tr()).boldText(
                              ColorConstants.primaryColor,
                              DimensionConstants.d20.sp,
                              TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesConstants.smileScreen);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: DimensionConstants.d10.h,
                        left: DimensionConstants.d20.w,
                        right: DimensionConstants.d131.w),
                    child: Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(DimensionConstants.d40.r),
                      ),
                      child: CustomShape(
                        bgColor: ColorConstants.whiteColor,
                        height: DimensionConstants.d51.h,
                        width: DimensionConstants.d263.w,
                        radius: BorderRadius.all(
                          Radius.circular(DimensionConstants.d40.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d14.h,
                              left: DimensionConstants.d20.w,
                              bottom: DimensionConstants.d13.h,
                              right: DimensionConstants.d76.w),
                          child: Text("smile".tr()).boldText(
                              ColorConstants.primaryColor,
                              DimensionConstants.d20.sp,
                              TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: DimensionConstants.d10.h,
                        left: DimensionConstants.d20.w,
                        right: DimensionConstants.d131.w),
                    child: Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(DimensionConstants.d40.r),
                      ),
                      child: CustomShape(
                        bgColor: ColorConstants.whiteColor,
                        height: DimensionConstants.d51.h,
                        width: DimensionConstants.d263.w,
                        radius: BorderRadius.all(
                          Radius.circular(DimensionConstants.d40.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d14.h,
                              left: DimensionConstants.d20.w,
                              bottom: DimensionConstants.d13.h,
                              right: DimensionConstants.d76.w),
                          child: Text("bow".tr()).boldText(
                              ColorConstants.primaryColor,
                              DimensionConstants.d20.sp,
                              TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: DimensionConstants.d10.h,
                        left: DimensionConstants.d20.w,
                        right: DimensionConstants.d131.w),
                    child: Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(DimensionConstants.d40.r),
                      ),
                      child: CustomShape(
                        bgColor: ColorConstants.whiteColor,
                        height: DimensionConstants.d51.h,
                        width: DimensionConstants.d263.w,
                        radius: BorderRadius.all(
                          Radius.circular(DimensionConstants.d40.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d14.h,
                              left: DimensionConstants.d20.w,
                              bottom: DimensionConstants.d13.h,
                              right: DimensionConstants.d76.w),
                          child: Text("greet".tr()).boldText(
                              ColorConstants.primaryColor,
                              DimensionConstants.d20.sp,
                              TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: DimensionConstants.d10.h,
                        left: DimensionConstants.d20.w,
                        right: DimensionConstants.d131.w),
                    child: Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(DimensionConstants.d40.r),
                      ),
                      child: CustomShape(
                        bgColor: ColorConstants.whiteColor,
                        height: DimensionConstants.d51.h,
                        width: DimensionConstants.d263.w,
                        radius: BorderRadius.all(
                          Radius.circular(DimensionConstants.d40.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d14.h,
                              left: DimensionConstants.d20.w,
                              bottom: DimensionConstants.d13.h,
                              right: DimensionConstants.d76.w),
                          child: Text("lifeVest".tr()).boldText(
                              ColorConstants.primaryColor,
                              DimensionConstants.d20.sp,
                              TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: DimensionConstants.d10.h,
                        left: DimensionConstants.d20.w,
                        right: DimensionConstants.d131.w),
                    child: Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(DimensionConstants.d40.r),
                      ),
                      child: CustomShape(
                        bgColor: ColorConstants.whiteColor,
                        height: DimensionConstants.d51.h,
                        width: DimensionConstants.d263.w,
                        radius: BorderRadius.all(
                          Radius.circular(DimensionConstants.d40.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d14.h,
                              left: DimensionConstants.d20.w,
                              bottom: DimensionConstants.d13.h,
                              right: DimensionConstants.d76.w),
                          child: Text("oxygenMask".tr()).boldText(
                              ColorConstants.primaryColor,
                              DimensionConstants.d20.sp,
                              TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: DimensionConstants.d10.h,
                        left: DimensionConstants.d20.w,
                        right: DimensionConstants.d131.w),
                    child: Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(DimensionConstants.d40.r),
                      ),
                      child: CustomShape(
                        bgColor: ColorConstants.whiteColor,
                        height: DimensionConstants.d51.h,
                        width: DimensionConstants.d263.w,
                        radius: BorderRadius.all(
                          Radius.circular(DimensionConstants.d40.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d14.h,
                              left: DimensionConstants.d20.w,
                              bottom: DimensionConstants.d13.h,
                              right: DimensionConstants.d76.w),
                          child: Text("saltBelt".tr()).boldText(
                              ColorConstants.primaryColor,
                              DimensionConstants.d20.sp,
                              TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: DimensionConstants.d10.h,
                        left: DimensionConstants.d20.w,
                        right: DimensionConstants.d131.w),
                    child: Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(DimensionConstants.d40.r),
                      ),
                      child: CustomShape(
                        bgColor: ColorConstants.whiteColor,
                        height: DimensionConstants.d51.h,
                        width: DimensionConstants.d263.w,
                        radius: BorderRadius.all(
                          Radius.circular(DimensionConstants.d40.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d14.h,
                              left: DimensionConstants.d20.w,
                              bottom: DimensionConstants.d13.h,
                              right: DimensionConstants.d76.w),
                          child: Text("emExit".tr()).boldText(
                              ColorConstants.primaryColor,
                              DimensionConstants.d20.sp,
                              TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: DimensionConstants.d10.h,
                        left: DimensionConstants.d20.w,
                        right: DimensionConstants.d131.w),
                    child: Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(DimensionConstants.d40.r),
                      ),
                      child: CustomShape(
                        bgColor: ColorConstants.whiteColor,
                        height: DimensionConstants.d51.h,
                        width: DimensionConstants.d263.w,
                        radius: BorderRadius.all(
                          Radius.circular(DimensionConstants.d40.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: DimensionConstants.d14.h,
                              left: DimensionConstants.d20.w,
                              bottom: DimensionConstants.d13.h,
                              right: DimensionConstants.d76.w),
                          child: Text("safetyNote".tr()).boldText(
                              ColorConstants.primaryColor,
                              DimensionConstants.d20.sp,
                              TextAlign.left),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    SharedPref.clearSharePref();

    Navigator.pushNamed(context, RoutesConstants.logInScreen);
    DialogHelper.showMessage(context, 'Sign Out successfully');
  }
}
