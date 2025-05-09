import 'package:firebase_core/firebase_core.dart';
import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/constant.dart';
import 'package:flowerlly_app/core/utils/common_widgets/routes.dart';
import 'package:flowerlly_app/core/utils/functions/condition_of_shared_preference.dart';
import 'package:flowerlly_app/core/utils/service_locator.dart';
import 'package:flowerlly_app/features/home/data/repos/home_repos_impl.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flowerlly_app/features/home/domain/repos/plant_details_repos.dart';
import 'package:flowerlly_app/features/home/domain/use_cases/fetch_plant_details_use_case.dart';
import 'package:flowerlly_app/features/home/domain/use_cases/fetch_plant_use_case.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_cubit/plant_cubit.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_details_cubit/plant_details_cubit.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_id_cubit.dart';
import 'package:flowerlly_app/features/home/presentation/managers/plant_type.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_list_entity/status_list_entity.dart';
import 'package:flowerlly_app/features/status/domain/repos/status_repos.dart';
import 'package:flowerlly_app/features/status/domain/use_cases/fetch_status_use_case.dart';
import 'package:flowerlly_app/features/status/presentation/managers/add_status/add_status_cubit.dart';
import 'package:flowerlly_app/features/status/presentation/managers/delete_status/delete_status_cubit.dart';
import 'package:flowerlly_app/features/status/presentation/managers/status/status_cubit.dart';
import 'package:flowerlly_app/features/status/presentation/managers/status_of_day/status_of_day_cubit.dart';
import 'package:flowerlly_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  setUp();

  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();

  runApp(const MyApp());
}

Future<void> initializeApp() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(PlantDetailsEntityAdapter());
  Hive.registerAdapter(PlantEntityAdapter());
  Hive.registerAdapter(StatusEntityAdapter());

  await Future.wait([
    Hive.openBox<PlantEntity>(kPlantBox),
    Hive.openBox<PlantEntity>(kFavouritPlantBox),
    Hive.openBox<PlantDetailsEntity>(kPlantDetailsBox),
    Hive.openBox<StatusEntity>(kStatusBox),
    Hive.openBox<StatusListEntity>(kStatusDayBox),
  ]);
  //  Clear all boxes after opening
  // await Hive.box<PlantEntity>(kPlantBox).clear();
  // await Hive.box<PlantEntity>(kFavouritPlantBox).clear();
  // await Hive.box<PlantDetailsEntity>(kPlantDetailsBox).clear();
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
            BlocProvider<PlantIdCubit>(
              create: (BuildContext context) => PlantIdCubit(),
            ),
            BlocProvider<PlantTypeCubit>(
              create: (BuildContext context) => PlantTypeCubit(),
            ),
            BlocProvider<PlantDetailsCubit>(
                create: (BuildContext context) =>
                    PlantDetailsCubit(FetchPlantDetailsUseCase(
                      plantDetailsRepos: getIt.get<PlantDetailsRepos>(),
                    ))
                      ..fetchPlantDetails(
                          context.read<PlantIdCubit>().getId().toString())),
            BlocProvider<PlantCubit>(
                create: (BuildContext context) => PlantCubit(FetchPlantUseCase(
                      homeRepos: getIt.get<HomeReposImpl>(),
                    ))
                      ..fetchPlant(context.read<PlantTypeCubit>().state)),
            BlocProvider<AddStatusCubit>(create: (context) => AddStatusCubit()),
            BlocProvider<StatusOfDayCubit>(
                create: (context) => StatusOfDayCubit()),
            BlocProvider<DeleteStatusCubit>(
                create: (context) => DeleteStatusCubit()),
            BlocProvider(
              create: (context) => StatusCubit(
                fetchStatusUseCase:
                    FetchStatusUseCase(statusRepos: getIt.get<StatusRepos>()),
              )..fetchStatus(),
            ),
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
