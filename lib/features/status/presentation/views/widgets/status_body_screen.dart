import 'package:flowerlly_app/constants/assets.dart';

import 'package:flowerlly_app/features/favourit/presentation/widgets/custom_app_bar.dart';


import 'package:flowerlly_app/features/status/presentation/views/calender_screen.dart';
import 'package:flowerlly_app/features/status/presentation/views/widgets/add_more_container.dart';
import 'package:flowerlly_app/features/status/presentation/views/widgets/list_of_check_box.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_size.dart';

class StatusBodyScreen extends StatelessWidget {
  const StatusBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppSize.height(context) * .06,
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Row(
              children: [
                const SizedBox(width: 40),
                const Expanded(
                  child: Center(
                    child: CustomAppBar(text: "Tracker"),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CalenderScreen.id);
                    },
                    child: SvgPicture.asset(Assets.assetsImagesCalender)),
                const SizedBox(width: 16), 
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppSize.height(context) * .06,
          ),
        ),
        const SliverToBoxAdapter(
          child: AddMoreContainer(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppSize.height(context) * .02,
          ),
        ),
        const SliverToBoxAdapter(
            child: ListOfCheckBox(
          isClose: true,
        )),
      ],
    );
  }
}
