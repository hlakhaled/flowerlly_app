import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/core/utils/common_widgets/routes.dart';
import 'package:flowerlly_app/core/utils/functions/condition_of_shared_preference.dart';
import 'package:flowerlly_app/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
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
        return MaterialApp(
            theme: ThemeData(
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
                fillColor: WidgetStateProperty.all(AllColors.kLightGreenColor),
                checkColor: WidgetStateProperty.all(AllColors.kGreenColor),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity:
                    const VisualDensity(horizontal: -2, vertical: -2),
              ),
            ),
            debugShowCheckedModeBanner: false,
            routes: Routes,
            initialRoute: snapshot.data);
      },
      future: conditionOfSharedPreference(),
    );
  }
}
