class GlobalVariables {
  static final GlobalVariables _globalVariables = GlobalVariables._internal();

  bool _ifUserWantedToBeRemembered = false;
  String?  _sid, _globalUserPassword;

  factory GlobalVariables() => _globalVariables;

  GlobalVariables._internal();

  String? get getGlobalUserPassword => _globalUserPassword;
  set setGlobalUserPassword(String password) => _globalUserPassword = password;

  bool get getUserDecision => _ifUserWantedToBeRemembered;
  set setUserDecision(bool decision) => _ifUserWantedToBeRemembered = decision;

  String? get getSid => _sid;
  set setSid(String sid) => _sid = sid;
}
