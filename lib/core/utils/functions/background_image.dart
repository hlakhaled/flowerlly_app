import 'package:flowerlly_app/constants/assets.dart';
import 'package:flutter/material.dart';

Widget backgroundImage({required Widget child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(Assets.assetsImagesBackground), fit: BoxFit.fill),
    ),
    child: child,
  );
}
