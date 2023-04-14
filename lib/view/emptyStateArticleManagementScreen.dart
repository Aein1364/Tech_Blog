// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tec/components/myComponents.dart';
import 'package:new_tec/view/writeArticleScreen.dart';

import '../gen/assets.gen.dart';

class EmptyStateArticleManagementScreen extends StatelessWidget {
  const EmptyStateArticleManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 200),
            child: MyAppBar(textTheme: textTheme, title: 'لیست مقاله ها'),
          ),
          Assets.img.sadMonkey.image(
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 300),
            child: Text(
              '''هنوز هیچ مقاله ای به جامعه گیک های فارسی 
           اضافه نکردی !!!''',
              style: textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => WriteArticleScreen());
              },
              child: const Text('بریم برای نوشتن یه مقاله باحال'))
        ],
      ),
    ));
  }
}
