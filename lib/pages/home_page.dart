import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/controllers/home_page_controller.dart';
import 'package:flutter_learn_getx/pages/custom_outlined_button.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/helpers/size_config.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageController = Get.find<HomePageController>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.getEdgeInsets()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TODO List Demo App2222',
              style: TextStyle(
                  fontSize: SizeConfig.getBigTitleSize(), fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Container(
              color: Color(0xFFFDF6E3),
              child: Text(
                'Do it now.',
                style: TextStyle(fontSize: SizeConfig.getTitleSize()),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 CustomOutlinedButton(
                  onPressed: () {
                    // Add task logic here
                  },
                  text: 'Add Task',
                  )
                // OutlinedButton(
                //   onPressed: () {
                //     // Add task logic here
                //   },
                //   style: OutlinedButton.styleFrom(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     side: const BorderSide(
                //         width: 1, color: Colors.lightBlueAccent),
                //   ),
                //   child: Text('Add Task',
                //       style: TextStyle(
                //           fontSize: SizeConfig.getTitleSize(), 
                //           color: Colors.lightBlueAccent)),
                // ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
