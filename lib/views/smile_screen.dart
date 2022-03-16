import 'dart:async';
import 'package:ai_score/constants/color_constants.dart';
import 'package:ai_score/constants/dimension_constants.dart';
import 'package:ai_score/enum/viewstate.dart';
import 'package:ai_score/extensions/allextensions.dart';
import 'package:ai_score/provider/smile_screen_provider.dart';
import 'package:ai_score/views/base_view.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../helper/dialog_helper.dart';
import '../helper/keyboard_helper.dart';
import '../main.dart';

class SmileScreen extends StatefulWidget {
  String? category;
  String? pageName;

  SmileScreen({Key? key, this.category, this.pageName}) : super(key: key);

  @override
  _SmileScreenState createState() => _SmileScreenState();
}

class _SmileScreenState extends State<SmileScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  SmileScreenProvider? provider;

  @override
  Widget build(BuildContext context) {
    /*widget.category;
    widget.pageName;*/
    return BaseView<SmileScreenProvider>(
      onModelReady: (provider) async {
        this.provider = provider;
        controller = CameraController(cameras![0], ResolutionPreset.max);
        controller!.initialize().then((_) {
          if (!mounted) {
            return;
          }
          provider.updateData(true);
        });

        await provider.getLastScoreData(context, widget.category.toString(),showLoader: true);
      },
      builder: (context, provider, _) {
        return Scaffold(
          appBar: KeyboardHelper.appBarWithBackTitle(
              context, widget.pageName.toString()),
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
                        height: DimensionConstants.d37.h,
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
                                color: Colors.black,
                                border: Border.all(
                                  color: controller != null &&
                                          controller!.value.isRecordingVideo
                                      ? Colors.redAccent
                                      : Colors.grey,
                                  width: 3.0,
                                ),
                              ),
                              child: SizedBox(
                                height: DimensionConstants.d523.h,
                                width: DimensionConstants.d348.w,
                                child: _cameraPreviewWidget(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          Container(
                            height: DimensionConstants.d52.h,
                            width: DimensionConstants.d225.w,
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
                                  right: DimensionConstants.d6.w),
                              child: ToggleSwitch(
                                minWidth: DimensionConstants.d106.w,
                                minHeight: DimensionConstants.d52.h,
                                cornerRadius: DimensionConstants.d5.r,
                                activeBgColors: const [
                                  [ColorConstants.primaryColor],
                                  [ColorConstants.colorOfButton]
                                ],
                                activeFgColor: Colors.white,
                                inactiveBgColor: ColorConstants.inActiveColor,
                                inactiveFgColor: Colors.red,
                                initialLabelIndex: provider.selectedToggle,
                                totalSwitches: 2,
                                labels: const ["Start", "Stop"],
                                radiusStyle: true,
                                onToggle: (index) {
                                  provider.updateSelectedState(index!);
                                  if (index == 0) {
                                    controller != null &&
                                            controller!.value.isInitialized &&
                                            !controller!.value.isRecordingVideo
                                        ? startVideoRecording().then((_) {
                                            if (mounted) {
                                              twoMinTimer();
                                              provider.updateData(true);
                                            }
                                          })
                                        : null;
                                  } else {
                                    if (provider.secondsCount == 0 &&
                                        provider.minuteCount == 0) {
                                    } else {
                                     /* provider.addscore(
                                        context,
                                        widget.category.toString(),
                                        provider.minuteCount +
                                            provider.secondsCount,
                                      );*/
                                      /*Timer(const Duration(milliseconds: 400), () {
                                        provider.getLastScoreData(
                                            context, widget.category.toString());

                                      });*/

                                    }
                                    controller != null &&
                                            controller!.value.isInitialized &&
                                            controller!.value.isRecordingVideo
                                        ? stopVideoRecording()
                                            .then((XFile? file) async {
                                            if (file != null) {
                                              provider.secondsCount = 0;
                                              provider.minuteCount = 0;
                                              provider.timer?.cancel();
                                              provider.uploadVideo(
                                                  context,
                                                  file,
                                                  widget.category.toString(),
                                                  provider.minuteCount +
                                                      provider.secondsCount);
                                            }
                                          })
                                        : null;
                                  }
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
                Padding(
                    padding: const EdgeInsets.only(),
                    child: provider.state == ViewState.Busy
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                ColorConstants.primaryColor))
                        : Container(
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
                                      child: Text(provider.round.toString())
                                          .boldText(
                                              ColorConstants.whiteColor,
                                              DimensionConstants.d20.sp,
                                              TextAlign.center),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: DimensionConstants.d17.h,
                                        left: DimensionConstants.d50.w,
                                        bottom: DimensionConstants.d39.h),
                                    child: Text(
                                            "0${provider.minuteCount.toString()} : ${(provider.secondsCount <= 9) ? "0${provider.secondsCount.toString()}" : provider.secondsCount.toString()}")
                                        .boldText(
                                            ColorConstants.whiteColor,
                                            DimensionConstants.d20.sp,
                                            TextAlign.center)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: DimensionConstants.d17.h,
                                        left: DimensionConstants.d35.w,
                                        bottom: DimensionConstants.d43.h),
                                    child: Text(
                                            provider.totalScoreGet.isNotEmpty
                                                ? provider.totalScoreGet[0]
                                                    .toString()
                                                : "")
                                        .boldText(
                                            ColorConstants.whiteColor,
                                            DimensionConstants.d20.sp,
                                            TextAlign.center)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: DimensionConstants.d17.h,
                                        left: DimensionConstants.d35.w,
                                        bottom: DimensionConstants.d43.h),
                                    child: Text(
                                            provider.totalScoreGet.length > 1
                                                ? provider.totalScoreGet[1]
                                                    .toString()
                                                : "")
                                        .boldText(
                                            ColorConstants.whiteColor,
                                            DimensionConstants.d20.sp,
                                            TextAlign.center)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: DimensionConstants.d17.h,
                                        left: DimensionConstants.d35.w,
                                        bottom: DimensionConstants.d43.h),
                                    child: Text(
                                            provider.totalScoreGet.length > 2
                                                ? provider.totalScoreGet[2]
                                                    .toString()
                                                : "")
                                        .boldText(
                                            ColorConstants.whiteColor,
                                            DimensionConstants.d20.sp,
                                            TextAlign.center)),
                              ],
                            ),
                          ))
              ],
            ),
          ),
        );
      },
    );
  }

  void logError(String code, String? message) {
    if (message != null) {
      print('Error: $code\nError Message: $message');
    } else {
      print('Error: $code');
    }
  }

  twoMinTimer() {
    /// Initialize a periodic timer with 1 second duration
    provider?.timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        /// callback will be executed every 1 second, increament a count value
        /// on each callback
        provider?.secondsCount++;
        if (provider?.secondsCount == 60 && provider?.minuteCount == 1) {
          provider?.minuteCount = 2;
          provider?.secondsCount = 0;
          if (provider?.secondsCount == 0 && provider?.minuteCount == 2) {
            DialogHelper.showMessage(
                context, "Sorry, Video record cannot be more than 2 minutes.");
            stopVideoRecording().then((XFile? file) async {
              if (mounted) {
                provider?.updateData(true);
              }
              if (file != null) {
                provider?.secondsCount = 0;
                provider?.minuteCount = 0;
                provider?.timer?.cancel();
                await provider?.uploadVideo(context, file,widget.category.toString(),
                    provider!.minuteCount +
                        provider!.secondsCount);
              }
            });
            timer.cancel();
          }
        } else if (provider?.secondsCount == 60 && provider?.minuteCount == 0) {
          provider?.secondsCount = 0;
          provider?.minuteCount = 1;
        }
        provider?.updateData(true);
      },
    );
  }

  CameraController? controller;
  XFile? imageFile;
  XFile? videoFile;
  VoidCallback? videoPlayerListener;
  bool enableAudio = true;
  final double _minAvailableZoom = 1.0;
  final double _maxAvailableZoom = 1.0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;

  // Counting pointers (number of user fingers on screen)
  int _pointers = 0;

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Center(
        child: Text(
          'Tap a camera',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    } else {
      return Listener(
        onPointerDown: (_) => _pointers++,
        onPointerUp: (_) => _pointers--,
        child: CameraPreview(
          controller!,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onScaleStart: _handleScaleStart,
              onScaleUpdate: _handleScaleUpdate,
              onTapDown: (TapDownDetails details) =>
                  onViewFinderTap(details, constraints),
            );
          }),
        ),
      );
    }
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (controller == null || _pointers != 2) {
      return;
    }

    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);

    await controller!.setZoomLevel(_currentScale);
  }

  /// Display the control bar with buttons to take pictures and record videos.

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    // ignore: deprecated_member_use
    provider!.scaffoldKey.currentState
        ?.showSnackBar(SnackBar(content: Text(message)));
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final CameraController cameraController = controller!;

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    cameraController.setExposurePoint(offset);
    cameraController.setFocusPoint(offset);
  }

  /*void onVideoRecordButtonPressed() {
    startVideoRecording().then((_) {
      if (mounted) {
        twoMinTimer();
        provider?.updateData(true);
      }
    });
  }*/

  /*void onStopButtonPressed() {
    stopVideoRecording().then((XFile? file) async {
      if (mounted) {
        provider?.updateData(true);
      }
      if (file != null) {
        provider?.secondsCount = 0;
        provider?.minuteCount = 0;
        provider?.timer?.cancel();
      }
    });
  }
*/
  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return;
    }

    try {
      await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return;
    }
  }

  Future<XFile?> stopVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}
