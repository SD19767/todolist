import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/pages/edit_page.dart';
import 'package:flutter_learn_getx/pages/home_page.dart';
import 'package:flutter_learn_getx/router/home_binding.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:flutter_learn_getx/services/translation_service.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/helpers/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.init();
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  Get.lazyPut<TaskService>(() => TaskService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetMaterialApp(
      translations: TranslationService(),
      locale: TranslationService.currentLanguageCode.locale,
      fallbackLocale: TranslationService.fallbackLocale.locale,
      initialRoute: '/',
      defaultTransition: Transition.fade,
      getPages: [
        GetPage(name: '/', page: () => const HomePage(), binding: HomeBinding()),
        GetPage(name: '/edit', page: () => const EditPage(), binding: EditBinding()),
      ],
    );
  }
}
