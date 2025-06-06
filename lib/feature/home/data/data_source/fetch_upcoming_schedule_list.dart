import 'package:digi_patient/feature/all_doctor/data/fetch_doctors_list.dart';
import 'package:digi_patient/feature/home/data/model/upcoming_schedule_model.dart';

List<UpcomingScheduleModel> fetchUpcomingScheduleList(){
  return [
    UpcomingScheduleModel(
      doctor: fetchDoctorsList()[1],
      remainingTime: 50,
    ),
    UpcomingScheduleModel(
      doctor: fetchDoctorsList()[7],
      remainingTime: 125,
    ),
    UpcomingScheduleModel(
      doctor: fetchDoctorsList()[3],
      remainingTime: 1850,
    ),
    UpcomingScheduleModel(
      doctor: fetchDoctorsList()[4],
      remainingTime: 2500,
    ),
    UpcomingScheduleModel(
      doctor: fetchDoctorsList()[5],
      remainingTime: 3200,
    ),
  ];
}