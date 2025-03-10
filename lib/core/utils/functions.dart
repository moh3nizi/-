// navigate
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/core/theme/app_theme.dart';

class Navigate {
  void navigate({required context, required page}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          Directionality(textDirection: TextDirection.rtl, child: page),
    ));
  }

  void navigateOff({required context, required page}) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) =>
            Directionality(textDirection: TextDirection.rtl, child: page),
      ),
      (route) => false,
    );
  }
}

//text theme
TextTheme textTheme(context) {
  return Theme.of(context).textTheme;
}

//widthScreen
double widthScreen(context) {
  return MediaQuery.of(context).size.width;
}

//heightScreen
double heightScreen(context) {
  return MediaQuery.of(context).size.height;
}

//moh3nlogo
Widget moh3n() {
  if (themeNotifier.value == ThemeMode.dark) {
    return SizedBox(
        height: 50, child: SvgPicture.asset('assets/logos/moh3n_dark.svg'));
  } else {
    return SizedBox(
        height: 50, child: SvgPicture.asset('assets/logos/moh3n_light.svg'));
  }
}
