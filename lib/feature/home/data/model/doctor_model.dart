import 'package:flutter/material.dart';

class DoctorModel {
  final String name;
  final String image;
  final String speciality;
  final int experience;
  final double fees;
  final int totalReview;
  final double rating;
  final List<String> qualifications; // New
  final String description; // New
  final int patientsServed; // New
  final ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);

  DoctorModel({
    required this.name,
    required this.image,
    required this.speciality,
    required this.experience,
    required this.fees,
    required this.totalReview,
    required this.rating,
    required this.qualifications,
    required this.description,
    required this.patientsServed,
  });

  void dispose() {
    isFavorite.dispose();
  }
}
