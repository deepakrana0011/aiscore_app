import 'package:ai_score/constants/dimension_constants.dart';
import 'package:ai_score/constants/image_constants.dart';
import 'package:ai_score/extensions/allextensions.dart';
import 'package:ai_score/model/dialogbox_model.dart';
import 'package:ai_score/model/list_model.dart';
import 'package:ai_score/widgets/custom_shape.dart';
import 'package:ai_score/widgets/image_view.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

class DialogHelper {
  static final border = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );

  static Future showDialogWithGridView(
    BuildContext context,
    String title,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 100.0,
          ),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(DimensionConstants.d20.r))),
          title: Text(title).boldText(ColorConstants.blackColor,
              DimensionConstants.d22.sp, TextAlign.left),
          content: Container(
            width: DimensionConstants.d375.w,
            height: DimensionConstants.d293.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                childAspectRatio: 1,
                mainAxisSpacing: 14,
                crossAxisSpacing: 9,
                children: <String>[
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                ].map((String url) {
                  return Material(
                    elevation: 3,
                    shadowColor: Colors.black,
                    borderRadius:
                        BorderRadius.circular(DimensionConstants.d10.r),
                    child: Container(
                      child: ImageView(
                        path: url,
                        height: DimensionConstants.d67.h,
                        width: DimensionConstants.d67.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }).toList()),
          ),
        );
      },
    );
  }

  static Future showDialogWithGridViewFour(
    BuildContext context,
    String title,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 100.0,
          ),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(DimensionConstants.d20.r))),
          title: Text(title).boldText(ColorConstants.blackColor,
              DimensionConstants.d22.sp, TextAlign.left),
          content: Container(
            width: DimensionConstants.d375.w,
            height: DimensionConstants.d293.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                childAspectRatio: 1,
                mainAxisSpacing: 14,
                crossAxisSpacing: 9,
                children: <String>[
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                  ImagesConstants.listImage,
                ].map((String url) {
                  return Material(
                    elevation: 3,
                    shadowColor: Colors.black,
                    borderRadius:
                        BorderRadius.circular(DimensionConstants.d10.r),
                    child: Container(
                      child: ImageView(
                        path: url,
                        height: DimensionConstants.d67.h,
                        width: DimensionConstants.d67.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }).toList()),
          ),
        );
      },
    );
  }

/*  static Future showDialogWithTwoButtonswithImage(
    BuildContext context,
    String title,
    String positiveButtonText,
    String negativeButtonText,
    ScreenScaler scaler,
    String image,
    TextEditingController link, {
    required VoidCallback positiveButtonPress,
    required VoidCallback negativeButtonPress,
    barrierDismissible = true,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16)),
                      color: ColorConstants.whiteColor,
                    ),
                    child: Center(
                        child: Image.asset(
                      ImageConstants.ic_title_logo,
                      height: 50,
                    )),
                  ),
                  SizedBox(
                    height: scaler.getHeight(0.5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ImageView(path: image)],
                  ),
                  SizedBox(
                    height: scaler.getHeight(0.5),
                  ),
                  Padding(
                    padding: scaler.getPaddingLTRB(2, 0, 2, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Empty field';
                        }
                      },
                      controller: link,
                      style: TextStyle(
                          color: ColorConstants.colorTextLightGray,
                          fontSize: scaler.getTextSize(10),
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstants.colorButtonbgColor),
                        ),
                        hintText: title == 'Whatsapp' || title == 'Phone'
                            ? 'Enter ' + title + ' number'
                            : 'Enter ' + title + ' id',
                        hintStyle: TextStyle(
                            color: ColorConstants.colorTextLightGray,
                            fontSize: scaler.getTextSize(10),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            shape: border,
            actions: <Widget>[
              FlatButton(
                child: Text(negativeButtonText).mediumText(
                    ColorConstants.colorButtonbgColor, 18, TextAlign.center),
                textColor: Colors.black87,
                onPressed: () {
                  if (negativeButtonPress != null) {
                    negativeButtonPress();
                  } else {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                },
              ),
              FlatButton(
                child: Text(positiveButtonText).mediumText(
                    ColorConstants.colorButtonbgColor, 18, TextAlign.center),
                onPressed: () {
                  if (positiveButtonPress != null) {
                    positiveButtonPress();
                  } else {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                },
              )
            ],
          );
        });
  }

  static Future showDialogWithOneButton(
    BuildContext context,
    String title,
    String content, {
    required VoidCallback positiveButtonPress,
    barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center),
          content: Text(content),
          shape: border,
          actions: <Widget>[
            FlatButton(
              child: Text('ok'.toUpperCase()).mediumText(
                  ColorConstants.primaryColor, 18, TextAlign.center),
              onPressed: () {
                if (positiveButtonPress != null) {
                  positiveButtonPress();
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
            )
          ],
        );
      },
    );
  }*/

  static showMessage(BuildContext context, String message) {
    Flushbar(
      message: message,
      backgroundColor: ColorConstants.textGrayColor,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
