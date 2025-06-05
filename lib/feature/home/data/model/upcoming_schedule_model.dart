import 'package:digi_patient/feature/home/data/model/doctor_model.dart';

class UpcomingScheduleModel {
  final DoctorModel doctor;
  final int remainingTime; // in minutes

  UpcomingScheduleModel({required this.doctor, required this.remainingTime});
}