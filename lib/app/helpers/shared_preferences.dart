import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static dynamic getFromStorage(item, type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type == 'string') {
      String? data = prefs.getString(item);
      return data;
    } else if (type == 'bool') {
      bool? data = prefs.getBool(item);
      return data;
    }
  }

  static void saveToStorage(item, value, type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type == 'string') {
      await prefs.setString(item, value);
    } else if (type == 'bool') {
      await prefs.setBool(item, value);
    }
  }

  static void removeFormStorage(item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(item);
  }

  static void clearStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
