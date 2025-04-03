import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/core/utils/functions/shared_preference_func.dart';
import 'package:flowerlly_app/features/home/presentation/views/widgets/plant_details.dart';
import 'package:flutter/material.dart';

class CustomDetatilsBottomSheet extends StatefulWidget {
  const CustomDetatilsBottomSheet({super.key});

  @override
  _CustomDetatilsBottomSheetState createState() =>
      _CustomDetatilsBottomSheetState();
}

class _CustomDetatilsBottomSheetState extends State<CustomDetatilsBottomSheet> {
  double _position = 1.0;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _password;
  CollectionReference user = FirebaseFirestore.instance.collection("Users");
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _position = 0.0;
      });
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> loadName() async {
    String id = await SharedPreferenceFunc.getId();

    DocumentSnapshot<Object?> snapshot = await user.doc(id).get();
    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      String name = data?['Name'] ?? '...';
      await SharedPreferenceFunc.setName(name);
      await SharedPreferenceFunc.set(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AllColors.kWhiteColor,
          border: Border.all(color: AllColors.kLightGreenColor, width: 2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(
            0, _position * AppSize.height(context), 0),
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 14),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: const PlantDetails(),
            ),
          ),
        ),
      ),
    );
  }
}
