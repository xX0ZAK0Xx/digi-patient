import 'package:digi_patient/core/sizes.dart';
import 'package:flutter/material.dart';
import 'widgets/doctor_speciality_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/search_widget.dart';
import 'widgets/upcoming_schedule_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: AppSizes.paddingBody,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Header,
            HeaderWidget(),

            //! Search,
            SearchWidget(),

            //! Upcoming Schedule,
            UpcomingScheduleWidget(),

            //! Doctor Speciality,
            DoctorSpecialityWidget(),
          ],
        ),
      ),
    );
  }
}
