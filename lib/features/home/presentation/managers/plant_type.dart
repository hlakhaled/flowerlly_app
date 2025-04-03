import 'package:flutter_bloc/flutter_bloc.dart';

class PlantTypeCubit extends Cubit<String> {
  PlantTypeCubit() : super("");

  void setType(String t) {
    emit(t);
  }

  String getType() {
    return state;
  }
}
