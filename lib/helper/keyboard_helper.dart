import 'package:ai_score/constants/dimension_constants.dart';
import 'package:ai_score/extensions/allextensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';
import '../constants/image_constants.dart';
import '../widgets/image_view.dart';

abstract class KeyboardHelper {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static PreferredSizeWidget appBarWithBack(
    BuildContext context, {
    showEdit = false,
    VoidCallback? editClick,
    bool message = false,
    VoidCallback? messageIconClick,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.primaryColor,
      leadingWidth: 100,
      leading: InkWell(
        onTap: () {
          hideKeyboard(context);
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(DimensionConstants.d20.w, 0.0, 0.0, 0.0),
          child: Row(
            children: <Widget>[
              const ImageView(
                path: ImagesConstants.backIcon,
                color: ColorConstants.whiteColor,
              ),
              SizedBox(
                width: DimensionConstants.d12.w,
              ),
              Text("back".tr()).regularText(ColorConstants.whiteColor,
                  DimensionConstants.d18.sp, TextAlign.left),
            ],
          ),
        ),
      ),
    );
  }

  static PreferredSizeWidget appBarWithBackTitle(
    BuildContext context,
    String title, {
    showEdit = false,
    VoidCallback? editClick,
    bool message = false,
    VoidCallback? messageIconClick,
  }) {
    return AppBar(
      centerTitle: true,
      title: Text(title).boldText(ColorConstants.whiteColor, DimensionConstants.d20.sp, TextAlign.center),
      elevation: 0,
      backgroundColor: ColorConstants.primaryColor,
      leadingWidth: 100,
      leading: InkWell(
        onTap: () {
          hideKeyboard(context);
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(DimensionConstants.d20.w, 0.0, 0.0, 0.0),
          child: Row(
            children: <Widget>[
              const ImageView(
                path: ImagesConstants.backIcon,
                color: ColorConstants.whiteColor,
              ),
              SizedBox(
                width: DimensionConstants.d12.w,
              ),
              Text("back".tr()).regularText(ColorConstants.whiteColor,
                  DimensionConstants.d18.sp, TextAlign.left),
            ],
          ),
        ),
      ),
    );
  }
}
