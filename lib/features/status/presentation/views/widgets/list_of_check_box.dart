
import 'package:flowerlly_app/features/status/presentation/managers/status/status_cubit.dart';
import 'package:flowerlly_app/features/status/presentation/views/widgets/items_in_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfCheckBox extends StatelessWidget {
  const ListOfCheckBox({super.key, this.isClose = false});
  final bool isClose;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatusCubit, StatusState>(
      builder: (context, state) {
        if (state is StatusFailure) {
          return Text(state.errorMsg);
        } else if (state is StatusSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 31),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.plant.length,
                itemBuilder: (context, index) => ItemsInList(
                      index: index,
                      length:state.plant.length,
                      items: state.plant[index],
                      isClose: isClose,
                    )),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
