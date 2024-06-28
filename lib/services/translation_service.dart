import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LanguageCode {
  en,
  zh_TW,
  ja,
}

extension LanguageCodeExtension on LanguageCode {
  String get key {
    switch (this) {
      case LanguageCode.en:
        return 'en';
      case LanguageCode.zh_TW:
        return 'zh-TW';
      case LanguageCode.ja:
        return 'ja';
    }
  }

  Locale get locale {
    switch (this) {
      case LanguageCode.en:
        return const Locale('en', 'US');
      case LanguageCode.zh_TW:
        return const Locale('zh', 'TW');
      case LanguageCode.ja:
        return const Locale('ja', 'JP');
    }
  }
}

class TranslationService extends Translations {
  static LanguageCode fallbackLocale = LanguageCode.en;
  static LanguageCode currentLanguageCode = LanguageCode.en;
  static var prefsKey = 'locale';
  static Map<String, Map<String, String>> _translations = {};

  static Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loadLanguages();
    String? localeString = prefs.getString(prefsKey);
    if (localeString != null) {
      currentLanguageCode = getLanguageCodeBy(localeString);
    } else {
      try {
        currentLanguageCode = getLanguageCodeByLocate(Get.deviceLocale);
      } catch(e) {
        currentLanguageCode = fallbackLocale;
      }
      await prefs.setString(prefsKey, currentLanguageCode.key);
    }
    Get.updateLocale(currentLanguageCode.locale);
  }

  static loadLanguages() {
    LanguageCode.values.forEach((languageCode) async {
      _translations.assign(languageCode.key,
          await _loadTranslations('assets/translations/$languageCode.json'));
    });
  }

  static Future<void> setLocale(LanguageCode languageCode) async {
    currentLanguageCode = languageCode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefsKey, languageCode.key);
    Get.updateLocale(languageCode.locale);
  }

  static Future<Map<String, String>> _loadTranslations(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return Map<String, String>.from(json.decode(jsonString));
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;

  static LanguageCode getLanguageCodeBy(String key) {
    switch (key) {
      case 'en':
        return LanguageCode.en;
      case 'zh-TW':
        return LanguageCode.zh_TW;
      case 'ja':
        return LanguageCode.ja;
      default:
        return LanguageCode.en;
    }
  }

   static LanguageCode getLanguageCodeByLocate(Locale? locale) {
    switch (locale?.languageCode) {
      case 'en':
        return LanguageCode.en;
      case 'zh':
        if (locale?.countryCode == 'TW') {
          return LanguageCode.zh_TW;
        } else {
          //TODO: other CN
          return LanguageCode.zh_TW;
        }
      case 'ja':
        return LanguageCode.ja;
      default:
        throw ArgumentError('Invalid language code');
      }
  }
}
