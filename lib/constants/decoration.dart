import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/image_view.dart';
import 'color_constants.dart';
import 'dimension_constants.dart';

class ViewDecoration {
  static InputDecoration inputDecorationWithCurve(String fieldName, Color color,
      {IconData? icon,
      Widget? prefixIcon,
      Widget? suffixIcon,
      double? textSize,
      Color? fillColor,
      double? radius,
      bool imageView = false,
      String? path,
      Color? textFiledColor}) {
    return InputDecoration(
      prefixIcon: prefixIcon == null ? null : prefixIcon,
      suffixIcon: suffixIcon == null
          ? null
          : imageView
              ? Container(
                  height: 1.h,
                  child: ImageView(
                    path: path,
                    height: 1.h,
                  ))
              : suffixIcon,
      hintText: fieldName,
      hintStyle: textFieldStyle(DimensionConstants.d18.sp,
          textFiledColor ?? ColorConstants.lightGrayColor),
      contentPadding: EdgeInsets.only(
          top: DimensionConstants.d8.h,
          bottom: DimensionConstants.d14.h,
          left: DimensionConstants.d20.w,
          right: DimensionConstants.d20.w),
      border: InputBorder.none,

      /* enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: fillColor ?? ColorConstants.lightGrayColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 8))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: fillColor ?? ColorConstants.lightGrayColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 8))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 8))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))));*/
    );
  }

  static InputDecoration inputDecorationWithCurvePassword(
      String fieldName, Color color,
      {IconData? icon,
      Widget? prefixIcon,
      Widget? suffixIcon,
      double? textSize,
      Color? fillColor,
      double? radius,
      bool imageView = false,
      String? path,
      Color? textFiledColor}) {
    return InputDecoration(
      prefixIcon: prefixIcon == null ? null : prefixIcon,
      suffixIcon: suffixIcon == null
          ? null
          : imageView
              ? Container(
                  height: 1.h,
                  child: ImageView(
                    path: path,
                    height: 1.h,
                  ))
              : suffixIcon,
      hintText: fieldName,
      hintStyle: textFieldStyle(DimensionConstants.d18.sp,
          textFiledColor ?? ColorConstants.lightGrayColor),
      contentPadding: EdgeInsets.only(
          top: DimensionConstants.d8.h,
          bottom: DimensionConstants.d14.h,
          left: DimensionConstants.d20.w,
          right: DimensionConstants.d55.w),
      border: InputBorder.none,

      /* enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: fillColor ?? ColorConstants.lightGrayColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 8))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: fillColor ?? ColorConstants.lightGrayColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 8))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 8))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))));*/
    );
  }

  /*static InputDecoration inputDecorationBottomLine(
      String fieldName, Color color,
      {IconData? icon}) {
    return InputDecoration(
        prefixIcon: icon == null
            ? null
            : Icon(
                icon,
                size: 12.sp,
                color: color,
              ),
        hintText: fieldName,
        filled: true,
        isDense: true,
        contentPadding: icon == null
            ? scaler.getPaddingLTRB(1, 0.5, 0.5, 1)
            : scaler.getPaddingLTRB(0.1, 0.1, 0.1, 0.1),
        fillColor: ColorConstants.colorWhite,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))));
  }

  static InputDecoration inputDecorationForSearchBox(
      String fieldName, ScreenScaler scaler) {
    return InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: scaler.getTextSize(15),
          color: ColorConstants.colorBlack,
        ),
        hintText: fieldName,
        hintStyle:
            textFieldStyle(scaler.getTextSize(12), ColorConstants.colorGray),
        filled: true,
        isDense: true,
        contentPadding: scaler.getPaddingLTRB(1, 1, 1, 1),
        fillColor: Colors.transparent,
        border: InputBorder.none);
  }*/

  static TextStyle textFieldStyle(double size, Color color) {
    return TextStyle(
        color: color,
        fontFamily: "Mulish",
        fontWeight: FontWeight.w400,
        fontSize: size);
  }
}
