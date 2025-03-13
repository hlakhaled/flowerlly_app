import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/core/utils/common_widgets/routes.dart';
import 'package:flowerlly_app/core/utils/functions/condition_of_shared_preference.dart';
import 'package:flowerlly_app/core/utils/service_locator.dart';
import 'package:flowerlly_app/features/home/data/repos/home_repos_impl.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flowerlly_app/features/home/domain/use_cases/fetch_category_of_plants_use_case.dart';
import 'package:flowerlly_app/features/home/domain/use_cases/fetch_plant_use_case.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_category_cubit/plant_category_cubit.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_cubit/plant_cubit.dart';
import 'package:flowerlly_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(PlantEntityAdapter());
  await Hive.openBox<PlantEntity>(kPlantBox);
  await Hive.openBox<PlantEntity>(kCategoryPlantBox);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        return MultiBlocProvider(
          providers: [
            BlocProvider<PlantCubit>(
                create: (BuildContext context) => PlantCubit(FetchPlantUseCase(
                      homeRepos: getIt.get<HomeReposImpl>(),
                    ))
                      ..fetchPlantUseCase),
            BlocProvider<PlantCategoryCubit>(
                create: (BuildContext context) =>
                    PlantCategoryCubit(FetchCategoryOfPlantsUseCase(
                      homeRepos: getIt.get<HomeReposImpl>(),
                    ))
                      ..fetchCategoryOfPlantsUseCase),
          ],
          child: MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: AllColors.kBackgroundColor,
                checkboxTheme: CheckboxThemeData(
                  shape: const CircleBorder(),
                  side: WidgetStateBorderSide.resolveWith(
                    (states) => BorderSide(
                      style: BorderStyle.solid,
                      color: states.contains(WidgetState.selected)
                          ? AllColors.kGreenColor
                          : AllColors.kLightGreenColor,
                      width: 1,
                    ),
                  ),
                  fillColor:
                      WidgetStateProperty.all(AllColors.kLightGreenColor),
                  checkColor: WidgetStateProperty.all(AllColors.kGreenColor),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity:
                      const VisualDensity(horizontal: -2, vertical: -2),
                ),
              ),
              debugShowCheckedModeBanner: false,
              routes: Routes,
              initialRoute: snapshot.data),
        );
      },
      future: conditionOfSharedPreference(),
    );
  }
}
