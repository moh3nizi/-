import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/core/helper/functions.dart';
import 'package:to_do_list/core/model/task_model.dart';
import 'package:to_do_list/core/theme/app_theme.dart';
import 'package:to_do_list/ui/edit/edit.dart';
import 'package:to_do_list/ui/history/history.dart';
import 'package:to_do_list/ui/home/home.dart';
import 'package:to_do_list/ui/settings/settings.dart';

int currentIndex = 1;

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          iconSize: 26,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ]),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentIndex == 0
                ? 'تاریخچه'
                : currentIndex == 1
                    ? 'خانه'
                    : 'تنظیمات'),
          ],
        ),
      ),
      body: _pages[currentIndex],
      floatingActionButton: currentIndex == 1 // Only show FAB on Home
          ? FloatingActionButton(
              onPressed: () {
                Navigate().navigate(
                    context: context,
                    page: EditScreen(
                      pageName: 'اضافه کردن تسک جدید',
                      taskModel: TaskModel(),
                    ));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.add,
                color: themeNotifier.value == ThemeMode.dark
                    ? AppTheme.dark().onPrimay
                    : AppTheme.light().onPrimay,
              ),
            )
          : null, // Hide
    );
  }
}

List _pages = [
  const History(),
  const Home(),
  const Settings(),
];
