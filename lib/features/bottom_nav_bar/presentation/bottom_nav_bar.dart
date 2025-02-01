import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/account/presentation/account_screen.dart';
import 'package:flowerlly_app/features/favourit/presentation/favourit_screen.dart';
import 'package:flowerlly_app/features/home/presentation/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static String id = "bottom";

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const FavouritScreen(),
    const Text("Status Page"),
    const AccountScreen(),
  ];

  final List<String> icons = [
    Assets.assetsImagesHome,
    Assets.assetsImagesHeart,
    Assets.assetsImagesTrack,
    Assets.assetsImagesFollowing,
  ];

  final List<String> labels = ["Home", "Favorites", "Status", "Account"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          currentIndex: currentPageIndex,
          backgroundColor: AllColors.kGreenColor,
          selectedItemColor: AllColors.kPinkColor,
          unselectedItemColor: AllColors.kWhiteColor,
          type: BottomNavigationBarType.fixed,

          // 🌟 Custom Label Styling
          selectedLabelStyle: Styles.textStyle11,
          unselectedLabelStyle: Styles.textStyle11,

          items: List.generate(icons.length, (index) {
            bool isSelected = index == currentPageIndex;
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    icons[index],
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      isSelected ? AllColors.kPinkColor : AllColors.kWhiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(labels[index],
                      style: Styles.textStyle11.copyWith(
                          color: isSelected
                              ? AllColors.kPinkColor
                              : AllColors.kWhiteColor)),
                  if (isSelected)
                    Container(
                      width: 30,
                      height: 4,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                        color: AllColors.kPinkColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                ],
              ),
              label: "",
            );
          }),
          onTap: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
        ),
      ),
    );
  }
}
