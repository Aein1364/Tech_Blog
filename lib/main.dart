import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:new_tec/gen/fonts.gen.dart';
import 'package:new_tec/view/SplashScreen.dart';

import 'package:new_tec/view/mainScreen.dart';

import '../../components/myColors.dart';

import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.scaffoldBg,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),
      theme: lightTheme(),
      home: const SplashScreen(),
      getPages: [
        GetPage(
          name: RouteScreenName.mainScreen,
          page: () => MainScreen(),
        ),
        GetPage(
          name: RouteScreenName.splashScreen,
          page: () => const SplashScreen(),
        ),
      ],
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(SolidColors.primeryColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 16, fontFamily: FontFamily.dana)),
              minimumSize: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const Size(190, 65);
                  } else {
                    return const Size(180, 55);
                  }
                },
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)))),
        ),
        drawerTheme:
            const DrawerThemeData(backgroundColor: SolidColors.scaffoldBg),
        scaffoldBackgroundColor: SolidColors.scaffoldBg,
        appBarTheme: const AppBarTheme(
            backgroundColor: SolidColors.scaffoldBg,
            foregroundColor: Colors.black),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black),
          titleMedium: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black),
          titleSmall: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black),
          bodyLarge: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.black),
          headlineLarge: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xff286BB8)),
          labelLarge: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Color(0xffffffff)),
          labelMedium: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Color(0xffffffff)),
        ));
  }
}

class RouteScreenName {
  static String mainScreen = '/MainScreen';
  static String splashScreen = '/SplashScreen';
}
