import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/controllers/home_page_controller.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageController = Get.find<HomePageController>();

    // 取得螢幕寬度
    double screenWidth = MediaQuery.of(context).size.height;

    // 設定文字大小比例
    double bigTitleSize = screenWidth * 0.08;
    double titleSize = screenWidth * 0.04;
    double edgeInsets = screenWidth * 0.1;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(edgeInsets),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TODO List Demo App',
        style: TextStyle(fontSize: bigTitleSize, fontWeight: FontWeight.w500),),
        SizedBox(height: 16),
        
            Container(
              color: Color(0xFFFDF6E3),
              child: Text(
                'Do it now.',
                style: TextStyle(fontSize: titleSize),
              ),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // Add task logic here
              },
              child: Text('Add Task', style: TextStyle(fontSize: titleSize)),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}