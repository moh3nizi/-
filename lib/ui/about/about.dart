import 'package:flutter/material.dart';
import 'package:to_do_list/core/theme/app_theme.dart';
import 'package:to_do_list/core/utils/functions.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('درباره ما')],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: widthScreen(context) - 30,
                decoration: BoxDecoration(
                    color: themeNotifier.value == ThemeMode.dark
                        ? AppTheme.dark().onPrimay
                        : AppTheme.light().onPrimay,
                    borderRadius: BorderRadius.circular(8)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'هدف اصلی:',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'یادداشت من ایجاد یک فضای دیجیتالی ساده و کارآمد برای نوشتن و سازماندهی یادداشت‌های روزانه شما است.',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'ارزش ها:',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'سادگی، دسترسی‌پذیری و امنیت اطلاعات کاربر.',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'تجربه کاربری:',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'طراحی مینیمالیستی و کاربرپسند که برای نوشتن سریع و مدیریت یادداشت‌ها بسیار مناسب است.',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              moh3n()
            ],
          ),
        ),
      ),
    );
  }
}
