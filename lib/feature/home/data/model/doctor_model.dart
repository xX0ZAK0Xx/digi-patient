import 'package:flutter/material.dart';

class DoctorModel {
  final String name;
  final String image;
  final String speciality;
  final double experience;
  final double fees;  
  final int totalReview;
  final double rating;
  final ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);

  DoctorModel({required this.name, required this.image, required this.speciality, required this.experience, required this.fees, required this.totalReview, required this.rating});

  void dispose(){
    isFavorite.dispose();
  }
}