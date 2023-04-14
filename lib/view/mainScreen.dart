// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tec/components/myColors.dart';
import 'package:new_tec/components/myStrings.dart';
import 'package:new_tec/controllers/homeItemsController.dart';
import 'package:new_tec/controllers/registerController.dart';
import 'package:new_tec/gen/assets.gen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/myComponents.dart';
import 'homeScreen.dart';
import 'profileScreen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  HomeItemsController homeItemsController = Get.put(HomeItemsController());
  RxInt selectedIndex = RxInt(0);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding:
                EdgeInsets.fromLTRB(Get.width * .075, 10, Get.width * .075, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu_rounded,
                    size: 30,
                  ),
                ),
                Assets.img.logo.image(
                  width: 100,
                ),
                const Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
        key: _key,
        drawer: myDrawer(textTheme),
        body: Stack(
          children: [
            Obx(
              () => IndexedStack(
                index: selectedIndex.value,
                children: [
                  HomeScreen(
                      homeItemsController: homeItemsController,
                      textTheme: textTheme),
                  const ProfileScreen(),
                ],
              ),
            ),
            //bottom navigation bar
            BottomNavigationBar(
              ontap: (int index) {
                selectedIndex.value = index;
              },
            )
          ],
        ),
      ),
    );
  }

  Widget myDrawer(TextTheme textTheme) {
    return Container(
      width: Get.width - 50,
      height: Get.height,
      color: SolidColors.scaffoldBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Assets.img.logo.image(
                width: Get.width / 2.5,
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 9,
          ),
          myDivider(),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 50, 20),
              child: drawerTiltelMethod(textTheme,
                  onPressed: () {}, title: MyStrings.profile)),
          myDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 50, 20),
            child: drawerTiltelMethod(
              textTheme,
              onPressed: () {},
              title: MyStrings.aboutTec,
            ),
          ),
          myDivider(),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 50, 20),
              child: drawerTiltelMethod(textTheme, title: MyStrings.sharingTec,
                  onPressed: () async {
                await Share.share(MyStrings.shareText);
              })),
          myDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 50, 20),
            child: drawerTiltelMethod(
              textTheme,
              onPressed: () async {
                await launchUrl(Uri.parse(MyStrings.tecGitHubUrl));
              },
              title: MyStrings.tecInGit,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  final Function(int index) ontap;
  BottomNavigationBar({
    super.key,
    required this.ontap,
  });
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: Get.height / 65,
        left: Get.width * .1,
        right: Get.width * .1,
        child: MyContainerNoImage(
          haswidth: true,
          width: Get.width,
          height: Get.height / 11,
          borderRadius: 25,
          hasGradient: true,
          gradientColors: GradientColors.bottomNavigation,
          beginGradientAlignment: Alignment.centerRight,
          endGradientAlignment: Alignment.centerLeft,
          color: Colors.transparent,
          hasColor: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => ontap(0),
                  child: Assets.img.icons.home.image(
                    width: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await registerController.registerMethod();
                  },
                  child: Assets.img.icons.edit.image(
                    width: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () => ontap(1),
                  child: Assets.img.icons.user.image(
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget drawerTiltelMethod(TextTheme textTheme,
    {required String title, required Function() onPressed}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      title,
      style: textTheme.titleSmall,
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
