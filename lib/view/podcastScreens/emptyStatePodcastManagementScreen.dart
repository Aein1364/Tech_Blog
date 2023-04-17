// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tec/components/myComponents.dart';
import 'package:new_tec/view/articleScreens/writeArticleScreen.dart';
import 'package:new_tec/view/podcastScreens/writeNewPodcastScreen.dart';

import '../../gen/assets.gen.dart';

class EmptyStatePodcastManagementScreen extends StatelessWidget {
  const EmptyStatePodcastManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 200),
            child: MyAppBar(textTheme: textTheme, title: 'مدیریت پادکست ها'),
          ),
          Assets.img.sadMonkey.image(
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 300),
            child: Text(
              '''هنوز هیچ پادکستی به جامعه گیک های فارسی 
           اضافه نکردی !!!''',
              style: textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => WriteNewPodcastScreen());
              },
              child: const Text('اضافه کردن یه پادکست جدید'))
        ],
      ),
    ));
  }
}
