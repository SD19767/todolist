import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationService extends Translations {
  static Locale? get locale => _locale;
  static Locale? _locale;
  static const fallbackLocale = Locale('en', 'US');
  static final List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'TW'),
    Locale('ja', 'JP'),
  ];

  static Map<String, Map<String, String>> _translations = {};

  static Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? localeString = prefs.getString('locale');
    if (localeString != null) {
      _locale = _getLocaleFromString(localeString);
    } else {
      _locale = Get.deviceLocale;
      if (!_isLocaleSupported(_locale)) {
        _locale = fallbackLocale;
      }
      await prefs.setString('locale', _locale.toString());
    }

    // 加載翻譯文件
    _translations = {
      'en_US': await _loadTranslations('assets/translations/en_US.json'),
      'zh_TW': await _loadTranslations('assets/translations/zh_TW.json'),
      'ja_JP': await _loadTranslations('assets/translations/ja_JP.json'),
    };

    Get.updateLocale(_locale!);
  }

  static bool _isLocaleSupported(Locale? locale) {
    return supportedLocales.contains(locale);
  }

  static Locale _getLocaleFromString(String localeString) {
    final parts = localeString.split('_');
    return Locale(parts[0], parts[1]);
  }

  static Future<void> setLocale(Locale locale) async {
    if (_isLocaleSupported(locale)) {
      _locale = locale;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('locale', locale.toString());
      Get.updateLocale(locale);
    }
  }

  static Future<Map<String, String>> _loadTranslations(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return Map<String, String>.from(json.decode(jsonString));
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;
}