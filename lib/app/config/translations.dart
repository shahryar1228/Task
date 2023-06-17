import 'package:get/get_navigation/src/root/internacionalization.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'fa': {
      'MenuOne': 'درباره مشاور',
      'MenuTwo': 'سوابق و افتخارات',
      'MenuThree': 'تیم ما',
    },
    'en_US': {
      'MenuOne': 'About the consultant',
      'MenuTwo': 'Records and honors',
      'MenuThree': 'Our Team',
    },
  };
}