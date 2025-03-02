import 'package:flowerlly_app/core/utils/functions/shared_preference_func.dart';
import 'package:flowerlly_app/features/bottom_nav_bar/presentation/bottom_nav_bar.dart';
import 'package:flowerlly_app/features/splash_screen/presentation/splash_screen.dart';

Future<String> conditionOfSharedPreference() async {
  String fun =
      await SharedPreferenceFunc.get() ? BottomNavBar.id : SplashScreen.id;
  return fun;
}
