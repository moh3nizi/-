import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/core/constants/constants.dart';
import 'package:to_do_list/core/helper/functions.dart';
import 'package:to_do_list/core/model/task_model.dart';
import 'package:to_do_list/core/theme/app_theme.dart';
import 'package:to_do_list/ui/screen/screen.dart';

TextEditingController _titleController = TextEditingController();
TextEditingController _bodyTextController = TextEditingController();

class EditScreen extends StatelessWidget {
  final String pageName;
  final TaskModel taskModel;
  const EditScreen(
      {super.key, required this.pageName, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    _titleController.text = taskModel.title;
    _bodyTextController.text = taskModel.bodyText;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(pageName)],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              onChanged: (value) {
                taskModel.title = _titleController.text;
                taskModel.bodyText = _bodyTextController.text;
                taskModel.date = DateTime.now();
                if (taskModel.isInBox) {
                  taskModel.save();
                } else {
                  var box = Hive.box<TaskModel>(taskModelName);
                  // taskModel.isDeleted = true;
                  box.add(taskModel);
                }
              },
              maxLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintTextDirection: TextDirection.rtl,
                border: InputBorder.none,
                fillColor: themeNotifier.value == ThemeMode.dark
                    ? AppTheme.dark().primaryColor
                    : AppTheme.light().primaryColor,
                hintStyle: const TextStyle(fontFamily: vazir, fontSize: 18),
                hintText: 'عنوان',
                contentPadding: const EdgeInsets.all(16.0),
              ),
            ),
            Expanded(
              child: TextField(
                controller: _bodyTextController,
                onChanged: (value) {
                  taskModel.title = _titleController.text;
                  taskModel.bodyText = _bodyTextController.text;
                  taskModel.date = DateTime.now();
                  if (taskModel.isInBox) {
                    taskModel.save();
                  } else {
                    var box = Hive.box<TaskModel>(taskModelName);
                    // taskModel.isDeleted = true;
                    box.add(taskModel);
                  }
                },
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  border: InputBorder.none,
                  fillColor: themeNotifier.value == ThemeMode.dark
                      ? AppTheme.dark().primaryColor
                      : AppTheme.light().primaryColor,
                  hintStyle: const TextStyle(fontFamily: vazir),
                  hintText: 'یادداشت خود را وارد کنید...',
                  contentPadding: const EdgeInsets.all(16.0),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: widthScreen(context) - 20,
        child: FloatingActionButton.extended(
          backgroundColor: themeNotifier.value == ThemeMode.dark
              ? AppTheme.dark().onPrimay
              : AppTheme.light().onPrimay,
          onPressed: () {
            Navigate().navigateOff(
              context: context,
              page: const Screen(),
            );
          },
          label: Text(
            'ذخیره',
            style: TextStyle(
              color: themeNotifier.value == ThemeMode.dark
                  ? AppTheme.dark().primaryColor
                  : AppTheme.light().primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
