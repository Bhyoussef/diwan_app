import 'package:shared_value/shared_value.dart';

final SharedValue<bool> isLoggedIn = SharedValue(
  value: false,
  key: "is_logged_in",
  autosave: true,
);

final SharedValue<String> accessToken = SharedValue(
  value: "",
  key: "access_token",
  autosave: true,
);

final SharedValue<String> appLanguage = SharedValue(
  value: "en",
  key: "app_language",
  autosave: true,
);

final SharedValue<String> userId = SharedValue(
  value: "",
  key: "user_id",
  autosave: true,
);

final SharedValue<bool> isQatari = SharedValue(
  value: false,
  key: "is_qatari",
  autosave: true,
);

final SharedValue<bool> isManager = SharedValue(
  value: false,
  key: "is_manager",
  autosave: true,
);
