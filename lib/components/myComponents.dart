// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'myColors.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      size: 32,
      color: SolidColors.primeryColor,
    );
  }
}

class MyContainerWithImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double borderRadius;
  final bool hasGradient;
  final List<Color> gradientColors;
  final AlignmentGeometry beginGradientAlignment;
  final AlignmentGeometry endGradientAlignment;
  const MyContainerWithImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.hasGradient,
    required this.gradientColors,
    required this.beginGradientAlignment,
    required this.endGradientAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const SpinKitFadingCube(
        size: 32,
        color: SolidColors.primeryColor,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.image_not_supported,
        size: 30,
        color: Colors.grey,
      ),
      imageBuilder: (context, imageProvider) {
        return Container(
            width: width,
            height: height,
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: hasGradient
                    ? LinearGradient(
                        colors: gradientColors,
                        begin: beginGradientAlignment,
                        end: endGradientAlignment)
                    : null),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ));
      },
    );
  }
}

class MyContainerNoImage extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final bool hasGradient;
  final bool haswidth;
  final bool hasColor;
  final List<Color> gradientColors;
  final AlignmentGeometry beginGradientAlignment;
  final AlignmentGeometry endGradientAlignment;
  final Color color;
  const MyContainerNoImage({
    super.key,
    required this.haswidth,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.hasGradient,
    required this.gradientColors,
    required this.beginGradientAlignment,
    required this.endGradientAlignment,
    required this.child,
    required this.color,
    required this.hasColor,
  });

  @override
  Widget build(BuildContext context) {
    if (haswidth) {
      return Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: hasColor ? color : null,
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: hasGradient
                ? LinearGradient(
                    colors: gradientColors,
                    begin: beginGradientAlignment,
                    end: endGradientAlignment)
                : null),
        child: child,
      );
    } else {
      return Container(
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
            color: hasColor ? color : null,
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: hasGradient
                ? LinearGradient(
                    colors: gradientColors,
                    begin: beginGradientAlignment,
                    end: endGradientAlignment)
                : null),
        child: child,
      );
    }
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.textTheme,
    required this.title,
  });

  final TextTheme textTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            width: Get.width / 9,
            height: Get.width / 9,
            decoration: const BoxDecoration(
                color: SolidColors.primeryColor2, shape: BoxShape.circle),
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          title,
          style:
              textTheme.titleLarge!.copyWith(color: SolidColors.primeryColor),
        )
      ],
    );
  }
}
