abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "zh_TW": zhTW
  };
}

final Map<String, String> enUS = {
  'greeting': 'Hello, How are you?',
  'day': "Awesome day..."
};

final Map<String, String> zhTW = {
  'greeting': '你好，世界',
  'day': "美好的一天..."
};