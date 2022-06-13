import 'package:ai_score/constants/color_constants.dart';
import 'package:ai_score/constants/dimension_constants.dart';
import 'package:ai_score/constants/image_constants.dart';
import 'package:ai_score/constants/route_constants.dart';
import 'package:ai_score/extensions/allextensions.dart';
import 'package:ai_score/provider/category_screen_provider.dart';
import 'package:ai_score/views/base_view.dart';
import 'package:ai_score/views/smile_screen.dart';
import 'package:ai_score/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/dialog_helper.dart';
import '../helper/shared_pref.dart';
import '../model/category_list_model.dart';
import '../widgets/custom_shape.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  String? imageAddress ;


  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryScreenProvider>(
      onModelReady: (provider) {
        provider.getCategoryData();
      },
      builder: (context, provider, _) {
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
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: DimensionConstants.d20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    ImageView(
                      path: ImagesConstants.appIcon,
                      height: DimensionConstants.d80.h,
                      width: DimensionConstants.d72.w,
                    ),
                    Row(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("accountId".tr()).boldText(
                            ColorConstants.primaryColor,
                            DimensionConstants.d25.sp,
                            TextAlign.left),
                        Text(SharedPref.prefs!
                                .getString(SharedPref.studentId)
                                .toString())
                            .boldText(ColorConstants.primaryColor,
                                DimensionConstants.d25.sp, TextAlign.left),
                      ],
                    ),
                    SizedBox(
                      height: DimensionConstants.d20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: DimensionConstants.d2.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesConstants.scoreAnalytics);
                            },
                            child: Material(
                              elevation: 4.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(DimensionConstants.d40.r),
                              ),
                              child: Container(
                                  height: DimensionConstants.d51.h,
                                  width: DimensionConstants.d263.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          DimensionConstants.d40.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: DimensionConstants.d20.w,
                                        top: DimensionConstants.d12.h),
                                    child: Text("scoreAnalytics".tr()).boldText(
                                        ColorConstants.primaryColor,
                                        DimensionConstants.d20.sp,
                                        TextAlign.left),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          Material(
                              elevation: 4.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(DimensionConstants.d40.r),
                              ),
                              child: Container(
                                height: DimensionConstants.d51.h,
                                width: DimensionConstants.d263.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        DimensionConstants.d40.r)),
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton(
                                      icon: Padding(
                                        padding: EdgeInsets.only(
                                            right: DimensionConstants.d20.w,
                                            top: DimensionConstants.d5.h),
                                        child: const ImageView(
                                          path: ImagesConstants.dropDown,
                                          color: ColorConstants.primaryColor,
                                        ),
                                      ),
                                      menuMaxHeight: DimensionConstants.d414.h,
                                      hint: const Text("Category").boldText(
                                          ColorConstants.primaryColor,
                                          DimensionConstants.d20.sp,
                                          TextAlign.left),
                                      value: provider.categoryDropDownValue,
                                      items: provider.categoryList
                                          .toSet()
                                          .map((CategoryList item) {
                                        return DropdownMenuItem(
                                            onTap: () {
                                              provider.categoryDropDownValueId = item.categoryNumber.toString();
                                              provider.nameOfCategory = item.categoryName.toString();
                                              provider.imageAddress = item.image.toString();

                                            },
                                            value: item.categoryNumber,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left:
                                                      DimensionConstants.d20.w),
                                              child: Text(item.categoryName
                                                      .toString())
                                                  .boldText(
                                                      ColorConstants
                                                          .primaryColor,
                                                      DimensionConstants.d20.sp,
                                                      TextAlign.center),
                                            ));
                                      }).toList(),
                                      onChanged: (String? value) {
                                        provider.onSelected(value);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SmileScreen(
                                                      category: value,
                                                      pageName: provider
                                                          .nameOfCategory,
                                                      audioPlayer: value == "30"
                                                          ? true
                                                          : false,
                                                      image: provider.imageAddress,
                                                    )));
                                      },
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
      },
    );
  }

  Future<void> _signOut() async {
    SharedPref.clearSharePref();

    Navigator.pushNamedAndRemoveUntil(
        context, RoutesConstants.logInScreen, (Route<dynamic> route) => false);
    DialogHelper.showMessage(context, 'Sign Out successfully');
  }
}
