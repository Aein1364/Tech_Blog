// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tec/components/myComponents.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../controllers/writeArticleController.dart';

// ignore: must_be_immutable
class HtmlScreen extends StatelessWidget {
  HtmlScreen({super.key});
  HtmlEditorController controller = HtmlEditorController();
  WriteArticleController writeArticleController =
      Get.put(WriteArticleController());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                  child: MyAppBar(
                      textTheme: textTheme, title: 'نوشتن/ویرایش مقاله'),
                ),
                HtmlEditor(
                    controller: controller,
                    htmlEditorOptions: HtmlEditorOptions(
                      shouldEnsureVisible: true,
                      hint: 'متن مقاله',
                      initialText: writeArticleController.articleContent.value,
                    ),
                    callbacks: Callbacks(
                      onChangeContent: (p0) {
                        writeArticleController.articleContent.value = p0!;
                        log(writeArticleController.articleContent.value
                            .toString());
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
