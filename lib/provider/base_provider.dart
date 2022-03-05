import 'package:ai_score/locator.dart';
import 'package:flutter/widgets.dart';

import '../enum/viewstate.dart';
import '../services/api.dart';

class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;
  Api api = locator<Api>();

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
