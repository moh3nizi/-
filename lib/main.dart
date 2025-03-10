import 'package:flutter/material.dart';
import 'package:to_do_list/core/constants/constants.dart';
import 'package:to_do_list/core/model/task_model.dart';
import 'package:to_do_list/core/theme/app_theme.dart';
import 'package:to_do_list/ui/splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init flutter
  await Hive.initFlutter();

  //dark mode
  await Hive.openBox<bool>(darkModeName);
  var darkMode = Hive.box<bool>(darkModeName);
  if (darkMode.isEmpty) {
    darkMode.put(1, false);
  }

  //task model
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(taskModelName);

  //runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    toggleTheme();
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode, child) {
        return MaterialApp(
          title: 'یادداشت من',
          theme: AppTheme.light().getTheme(),
          darkTheme: AppTheme.dark().getTheme(),
          themeMode: currentMode,
          home: const SplashScreen(),
        );
      },
    );
  }
}
