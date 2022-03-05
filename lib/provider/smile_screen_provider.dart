import 'dart:io';

import 'package:ai_score/provider/base_provider.dart';
import 'package:camera/camera.dart';

class SmileScreenProvider extends BaseProvider {
  CameraController? controller;
  XFile? imageFile;
  XFile? videoFile;

  bool enableAudio = true;
}
