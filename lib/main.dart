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

// import 'package:flutter/material.dart';
// import 'package:numberpicker/numberpicker.dart';

// void main() {
//   runApp(new ExampleApp());
// }

// class ExampleApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'NumberPicker Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Integer'),
//               Tab(text: 'Decimal'),
//             ],
//           ),
//           title: Text('Numberpicker example'),
//         ),
//         body: TabBarView(
//           children: [
//             _IntegerExample(),
//             _DecimalExample(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _IntegerExample extends StatefulWidget {
//   @override
//   __IntegerExampleState createState() => __IntegerExampleState();
// }

// class __IntegerExampleState extends State<_IntegerExample> {
//   int _currentIntValue = 10;
//   int _currentHorizontalIntValue = 10;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         SizedBox(height: 16),
//         Text('Default', style: Theme.of(context).textTheme.headline6),
//         NumberPicker(
//           value: _currentIntValue,
//           minValue: 0,
//           maxValue: 100,
//           step: 10,
//           haptics: true,
//           onChanged: (value) => setState(() => _currentIntValue = value),
//         ),
//         SizedBox(height: 32),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () => setState(() {
//                 final newValue = _currentIntValue - 10;
//                 _currentIntValue = newValue.clamp(0, 100);
//               }),
//             ),
//             Text('Current int value: $_currentIntValue'),
//             IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () => setState(() {
//                 final newValue = _currentIntValue + 20;
//                 _currentIntValue = newValue.clamp(0, 100);
//               }),
//             ),
//           ],
//         ),
//         Divider(color: Colors.grey, height: 32),
//         SizedBox(height: 16),
//         Text('Horizontal', style: Theme.of(context).textTheme.headline6),
//         NumberPicker(
//           value: _currentHorizontalIntValue,
//           minValue: 0,
//           maxValue: 100,
//           step: 10,
//           itemHeight: 100,
//           axis: Axis.horizontal,
//           onChanged: (value) =>
//               setState(() => _currentHorizontalIntValue = value),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.black26),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () => setState(() {
//                 final newValue = _currentHorizontalIntValue - 10;
//                 _currentHorizontalIntValue = newValue.clamp(0, 100);
//               }),
//             ),
//             Text('Current horizontal int value: $_currentHorizontalIntValue'),
//             IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () => setState(() {
//                 final newValue = _currentHorizontalIntValue + 20;
//                 _currentHorizontalIntValue = newValue.clamp(0, 100);
//               }),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class _DecimalExample extends StatefulWidget {
//   @override
//   __DecimalExampleState createState() => __DecimalExampleState();
// }

// class __DecimalExampleState extends State<_DecimalExample> {
//   double _currentDoubleValue = 3.0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         SizedBox(height: 16),
//         Text('Decimal', style: Theme.of(context).textTheme.headline6),
//         DecimalNumberPicker(
//           value: _currentDoubleValue,
//           minValue: 0,
//           maxValue: 10,
//           decimalPlaces: 2,
//           onChanged: (value) => setState(() => _currentDoubleValue = value),
//         ),
//         SizedBox(height: 32),
//       ],
//     );
//   }
// }
