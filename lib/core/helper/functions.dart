// navigate
import 'package:flutter/material.dart';

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
