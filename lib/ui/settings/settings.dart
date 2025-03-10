import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/core/utils/functions.dart';
import 'package:to_do_list/core/theme/app_theme.dart';
import 'package:to_do_list/ui/about/about.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 90,
            width: widthScreen(context),
            decoration: BoxDecoration(
                color: themeNotifier.value == ThemeMode.dark
                    ? AppTheme.dark().onPrimay
                    : AppTheme.light().onPrimay,
                borderRadius: BorderRadius.circular(28)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text('حالت شب'),
                  ),
                  Switch(
                    trackColor: WidgetStatePropertyAll(
                        themeNotifier.value == ThemeMode.dark
                            ? AppTheme.dark().primaryColor
                            : AppTheme.light().primaryColor),
                    thumbColor: const WidgetStatePropertyAll(Colors.white),
                    value: themeNotifier.value == ThemeMode.dark,
                    onChanged: (value) {
                      var darkMode = Hive.box<bool>(darkModeName);
                      if (darkMode.get(1)!) {
                        darkMode.put(1, false);
                      } else {
                        darkMode.put(1, true);
                      }
                      toggleTheme();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () => Navigate()
                .navigate(context: context, page: const AboutScreen()),
            child: Container(
              height: 90,
              width: widthScreen(context),
              decoration: BoxDecoration(
                  color: themeNotifier.value == ThemeMode.dark
                      ? AppTheme.dark().onPrimay
                      : AppTheme.light().onPrimay,
                  borderRadius: BorderRadius.circular(28)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text('درباره ما'),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: themeNotifier.value == ThemeMode.dark
                          ? Colors.black
                          : Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Text(
          'v1.0.0',
          style: TextStyle(
            color: themeNotifier.value == ThemeMode.dark
                ? AppTheme.dark().onPrimay
                : AppTheme.light().onPrimay,
          ),
        ),
        const Expanded(child: SizedBox()),
        moh3n()
      ],
    );
  }
}
