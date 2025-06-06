import 'package:digi_patient/feature/home/data/model/doctor_model.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/app_scaffold.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ListView(
        children: [

        ],
      ),
    );
  }
}