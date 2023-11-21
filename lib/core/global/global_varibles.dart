class GlobalVariables {
  static final GlobalVariables _globalVariables = GlobalVariables._internal();

  bool _ifUserWantedToBeRemembered = false;
  String? _apiKey, _apiSecret, _globalUserPassword;

  factory GlobalVariables() => _globalVariables;

  GlobalVariables._internal();

  String? get getGlobalUserPassword => _globalUserPassword;
  set setGlobalUserPassword(String password) => _globalUserPassword = password;

  bool get getUserDecision => _ifUserWantedToBeRemembered;
  set setUserDecision(bool decision) => _ifUserWantedToBeRemembered = decision;

  String? get getApiKey => _apiKey;
  set setApiKey(String key) => _apiKey = key;

  String? get getApiSecret => _apiSecret;
  set setApiSecret(String secret) => _apiSecret = secret;
}
