import 'package:flutter_bloc/flutter_bloc.dart';

class PlantIdCubit extends Cubit<int> {
  PlantIdCubit() : super(1);

  void changeId(int itemId) {
    emit(itemId);

    print(itemId);
  }

  int getId() => state;
}
