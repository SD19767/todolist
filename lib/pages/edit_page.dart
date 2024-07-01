import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/controllers/edit_page_controller.dart';
import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:flutter_learn_getx/helpers/size_config.dart';
import 'package:flutter_learn_getx/widgets/custom_outlined_button.dart';
import 'package:get/get.dart';


class EditPage extends GetView<EditPageController> {
  const EditPage({super.key});
  @override
  Widget build(BuildContext context) {
    final editPageController =
        Get.put(EditPageController(id: Get.parameters['id']));
    InputDecoration inputDecoration = InputDecoration(
      labelText: 'task_name'.tr,
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(editPageController.editType ? 'edit_todo'.tr : 'add_todo'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.getEdgeInsets()),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IdText(editPageController: editPageController),
              SizedBox(height: SizeConfig.getVerticalSpacer()),
              TaskNamingTextField(
                  editPageController: editPageController,
                  inputDecoration: inputDecoration),
              SizedBox(height: SizeConfig.getVerticalSpacer()),
              AddTaskStatusBox(
                  inputDecoration: inputDecoration,
                  editPageController: editPageController),
              SizedBox(height: SizeConfig.getVerticalSpacer()),
              ButtonGroup(editPageController: editPageController),
            ],
          ),
        ),
      ),
    );
  }
}

class IdText extends StatelessWidget {
  const IdText({
    super.key,
    required this.editPageController,
  });

  final EditPageController editPageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('#'),
        Obx(() => Text(editPageController.task.value.id)),
        const Spacer(),
      ],
    );
  }
}

class TaskNamingTextField extends StatelessWidget {
  const TaskNamingTextField({
    super.key,
    required this.editPageController,
    required this.inputDecoration,
  });

  final EditPageController editPageController;
  final InputDecoration inputDecoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: SizeConfig.getVerticalSpacer(),
        child: SizedBox(
          height: SizeConfig.getVerticalSpacer(),
          child: TextField(
            controller: editPageController.nameController,
            decoration: inputDecoration,
          ),
        ));
  }
}

class ButtonGroup extends StatelessWidget {
  const ButtonGroup({
    super.key,
    required this.editPageController,
  });

  final EditPageController editPageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomOutlinedButton(
          onPressed: () {
            editPageController.onCancel();
          },
          text: 'cancel'.tr,
        ),
        const Spacer(),
        CustomOutlinedButton(
          onPressed: () {
            editPageController.onSave();
          },
          text: 'save'.tr,
        ),
      ],
    );
  }
}

//AddTaskStatusBox
class AddTaskStatusBox extends StatelessWidget {
  const AddTaskStatusBox({
    super.key,
    required this.inputDecoration,
    required this.editPageController,
  });

  final InputDecoration inputDecoration;
  final EditPageController editPageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getVerticalSpacer(),
      child: Obx(() {
        return InputDecorator(
          decoration: inputDecoration.copyWith(labelText: 'status'.tr),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<TaskStatus>(
              isExpanded: true,
              value: editPageController.task.value.status,
              onChanged: (TaskStatus? newValue) {
                if (newValue != null) {
                  editPageController.task.update((task) {
                    task?.status = newValue;
                  });
                }
              },
              items: TaskStatus.values.map((TaskStatus status) {
                return DropdownMenuItem<TaskStatus>(
                  value: status,
                  child: Text(status.description),
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
