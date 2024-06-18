import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/controllers/home_page_controller.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:get/get.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
      ),
      body: Center(
        child: Text('Edit Page'),
      ),
    );
  }
}
