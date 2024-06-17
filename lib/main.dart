import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/data_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  // 初始化控制器
  final DataController counterController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Example')),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text('Clicks: ${counterController.count}')),
            Text('Clicks: ?????}'),
            FloatingActionButton(
              onPressed: counterController.decrease, 
              child:  Icon(Icons.remove),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
