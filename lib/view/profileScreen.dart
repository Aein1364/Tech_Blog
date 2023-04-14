// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:new_tec/components/myColors.dart';
import 'package:new_tec/components/myStrings.dart';
import 'package:new_tec/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
            child: Assets.img.icons.authorImage.image(scale: .8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.pen.image(width: 20),
              const SizedBox(
                width: 7,
              ),
              Text(
                MyStrings.imageProfileEditing,
                style: textTheme.headlineLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            'فاطمه امیری',
            style:
                textTheme.titleLarge!.copyWith(color: SolidColors.primeryColor),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
            child: Text(
              'fatemeamiri@gmail.com',
              style: textTheme.titleMedium,
            ),
          ),
          myDivider(),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: profileTiltelMethod(textTheme, context,
                  onPressed: () {}, title: MyStrings.myFavoriteArticle)),
          myDivider(),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: profileTiltelMethod(textTheme, context,
                  onPressed: () {}, title: MyStrings.myFavoritePodcasts)),
          myDivider(),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: profileTiltelMethod(textTheme, context,
                  onPressed: () {}, title: MyStrings.exitProfileAccount)),
        ],
      ),
    );
  }
}

Widget profileTiltelMethod(TextTheme textTheme, BuildContext context,
    {required String title, required Function() onPressed}) {
  var size = MediaQuery.of(context).size;
  return SizedBox(
    width: size.width - 100,
    child: TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(SolidColors.primeryColor2)),
      onPressed: onPressed,
      child: Text(
        title,
        style: textTheme.titleMedium,
      ),
    ),
  );
}

Widget myDivider() {
  return const Divider(
    indent: 50,
    endIndent: 50,
    thickness: 1,
    color: SolidColors.divider,
  );
}
