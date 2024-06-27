import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/pages/edit_page.dart';
import 'package:flutter_learn_getx/pages/home_page.dart';
import 'package:flutter_learn_getx/router/home_binding.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:flutter_learn_getx/services/translation_service.dart';
import 'package:get/get.dart';
import 'controllers/home_page_controller.dart';
import 'package:flutter_learn_getx/helpers/size_config.dart';
import 'translations/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationService(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      initialRoute: '/',
      defaultTransition: Transition.fade,
      getPages: [
        GetPage(name: '/', page: () => HomePage(), binding: HomeBinding()),
        GetPage(name: '/edit', page: () => EditPage(), binding: HomeBinding()),
      ],
    );
  }
}