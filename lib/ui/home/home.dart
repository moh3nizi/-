import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/core/constants/constants.dart';
import 'package:to_do_list/core/helper/functions.dart';
import 'package:to_do_list/core/model/task_model.dart';
import 'package:to_do_list/core/theme/app_theme.dart';
import 'package:to_do_list/ui/edit/edit.dart';
import 'package:to_do_list/ui/widgets/task.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<TaskModel>(taskModelName);
    TextEditingController controller = TextEditingController();
    ValueNotifier<String> searchKey = ValueNotifier('');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onChanged: (value) {
                searchKey.value = controller.text;
              },
              style: TextStyle(
                  color: themeNotifier.value == ThemeMode.dark
                      ? AppTheme.dark().primaryColor
                      : Colors.white),
              decoration: const InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search),
                  labelText: 'جستجو...'),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Text(
                'یادداشت ها',
                style: TextStyle(
                    color: themeNotifier.value == ThemeMode.dark
                        ? AppTheme.dark().onPrimay
                        : AppTheme.light().onPrimay,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
              child: ValueListenableBuilder<String>(
            valueListenable: searchKey,
            builder: (context, value, child) {
              return ValueListenableBuilder<Box<TaskModel>>(
                  valueListenable: box.listenable(),
                  builder: (context, value, child) {
                    List<TaskModel> items = [];
                    if (controller.text.isEmpty) {
                      items = box.values
                          .where(
                            (element) => element.isDeleted == false,
                          )
                          .toList();
                    } else {
                      items = box.values
                          .where(
                            (element) =>
                                element.title.contains(controller.text),
                          )
                          .where(
                            (element) => element.isDeleted == false,
                          )
                          .toList();
                    }
                    if (items.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: themeNotifier.value == ThemeMode.dark
                                  ? SizedBox(
                                      height: heightScreen(context) / 3.4,
                                      child: SvgPicture.asset(
                                          'assets/logos/empty_dark.svg'),
                                    )
                                  : SizedBox(
                                      height: heightScreen(context) / 3.4,
                                      child: SvgPicture.asset(
                                          'assets/logos/empty_light.svg'),
                                    )),
                          SizedBox(
                            height: heightScreen(context) / 8,
                          ),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () => Navigate().navigate(
                                  context: context,
                                  page: EditScreen(
                                    pageName: 'ویرایش یادداشت',
                                    taskModel: items[index],
                                  )),
                              child: Task(
                                pages: Pages.home,
                                taskModel: items[index],
                                // },
                              ));
                        },
                      );
                    }
                  });
            },
          ))
        ],
      ),
    );
  }
}
