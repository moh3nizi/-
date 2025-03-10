import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list/core/helper/functions.dart';
import 'package:to_do_list/core/theme/app_theme.dart';
import 'package:to_do_list/ui/screen/screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) =>
          // ignore: use_build_context_synchronously
          Navigate().navigateOff(context: context, page: const Screen()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: themeNotifier.value == ThemeMode.dark
                  ? Lottie.asset(repeat: false, 'assets/logos/book_dark.json')
                  : Lottie.asset(repeat: false, 'assets/logos/book.json'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'یادداشت من',
              style: TextStyle(
                  color: themeNotifier.value == ThemeMode.dark
                      ? AppTheme.dark().onPrimay
                      : AppTheme.light().onPrimay),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
