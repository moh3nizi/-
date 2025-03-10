import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list/core/constants/constants.dart';
import 'package:to_do_list/core/helper/functions.dart';
import 'package:to_do_list/core/model/task_model.dart';
import 'package:to_do_list/ui/widgets/task.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<TaskModel>(taskModelName);
    return ValueListenableBuilder<Box<TaskModel>>(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          List<TaskModel> items = [];

          items = box.values
              .where(
                (element) => element.isDeleted == true,
              )
              .toList();

          if (items.isEmpty) {
            return Center(
                child: SizedBox(
              height: heightScreen(context) / 3.4,
              child: Lottie.asset(repeat: false, 'assets/logos/trash.json'),
            ));
          } else {
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Task(
                  pages: Pages.history,
                  taskModel: items[index],
                );
              },
            );
          }
        });
  }
}
