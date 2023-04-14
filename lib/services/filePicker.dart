// ignore_for_file: file_names

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/filePickerController.dart';

FilePickerController filePickerController = Get.put(FilePickerController());
Future pickFile() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null) {
    filePickerController.file.value = result.files.first;
  } else {
    debugPrint('no file picked');
  }
}
