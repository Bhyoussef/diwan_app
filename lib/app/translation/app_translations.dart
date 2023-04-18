import 'package:diwanapp/app/translation/ar_AR/ar_translations.dart';
import 'package:diwanapp/app/translation/en_US/en_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': en,
    'ar_AR': ar,
  };
}
