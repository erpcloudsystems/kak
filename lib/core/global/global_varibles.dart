import 'package:kak/core/utils/enums.dart';

class GlobalVariables {
  static final GlobalVariables _globalVariables = GlobalVariables._internal();

  bool _ifUserWantedToBeRemembered = false;
  String? _sid, _globalUserPassword;
  DeviceLanguage? _deviceLanguage;

  factory GlobalVariables() => _globalVariables;

  GlobalVariables._internal();

  String? get getGlobalUserPassword => _globalUserPassword;
  set setGlobalUserPassword(String password) => _globalUserPassword = password;

  bool get getUserDecision => _ifUserWantedToBeRemembered;
  set setUserDecision(bool decision) => _ifUserWantedToBeRemembered = decision;

  String? get getSid => _sid;
  set setSid(String sid) => _sid = sid;

  DeviceLanguage? get getDeviceLanguage => _deviceLanguage;
  set setDeviceLanguage(DeviceLanguage deviceLanguage) =>
      _deviceLanguage = deviceLanguage;
}
