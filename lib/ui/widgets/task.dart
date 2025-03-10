import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list/core/constants/constants.dart';
import 'package:to_do_list/core/helper/functions.dart';
import 'package:to_do_list/core/model/task_model.dart';
import 'package:to_do_list/core/theme/app_theme.dart';

class Task extends StatefulWidget {
  final TaskModel taskModel;
  final Pages pages;

  const Task({
    super.key,
    required this.taskModel,
    required this.pages,
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 4, left: 4),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            if (widget.pages == Pages.history)
              SlidableAction(
                foregroundColor: Colors.yellow,
                onPressed: (context) {
                  widget.taskModel.isDeleted = false;
                  widget.taskModel.save();
                },
                backgroundColor: themeNotifier.value == ThemeMode.dark
                    ? AppTheme.dark().onPrimay
                    : AppTheme.light().onPrimay,
                borderRadius: BorderRadius.circular(8),
                icon: Icons.history,
              ),

            // delete option
            SlidableAction(
              foregroundColor: themeNotifier.value == ThemeMode.dark
                  ? AppTheme.dark().primaryColor
                  : Colors.white,
              // ignore: unrelated_type_equality_checks
              onPressed: (context) {
                widget.pages == Pages.home ? true : false;
                if (widget.pages == Pages.home) {
                  widget.taskModel.isDeleted = true;
                  widget.taskModel.save();
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: AlertDialog(
                        backgroundColor: themeNotifier.value == ThemeMode.dark
                            ? AppTheme.dark().primaryColor
                            : AppTheme.light().primaryColor,
                        actions: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'آیا از حذف این مورد مطمئن هستید؟',
                                  style: TextStyle(
                                      color:
                                          themeNotifier.value == ThemeMode.dark
                                              ? AppTheme.dark().onPrimay
                                              : AppTheme.light().onPrimay),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          widget.taskModel.delete();
                                          Navigator.pop(context);
                                        },
                                        child: const Text('تایید')),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('لغو'))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
              backgroundColor: themeNotifier.value == ThemeMode.dark
                  ? AppTheme.dark().onPrimay
                  : AppTheme.light().onPrimay,

              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: Container(
          height: 100,
          width: widthScreen(context),
          decoration: BoxDecoration(
              color: themeNotifier.value == ThemeMode.dark
                  ? AppTheme.dark().onPrimay
                  : AppTheme.light().onPrimay,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: widget.taskModel.isComplited,
                      fillColor: WidgetStatePropertyAll(
                          themeNotifier.value == ThemeMode.dark
                              ? AppTheme.dark().primaryColor
                              : Colors.white),
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            widget.taskModel.isComplited = value;
                          }
                        });
                      },
                    ),
                    SizedBox(
                      width: widthScreen(context) / 2,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        widget.taskModel.title,
                        style: TextStyle(
                            decorationThickness: 4,
                            decorationColor: Colors.amber,
                            decoration: widget.taskModel.isComplited
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Formats().shamsi(widget.taskModel.date.toJalali())',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: themeNotifier.value == ThemeMode.dark
                              ? Colors.black.withOpacity(0.7)
                              : Colors.white.withOpacity(0.7),
                          fontFamily: 'Itim'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
