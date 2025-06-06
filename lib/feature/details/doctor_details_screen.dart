import 'package:digi_patient/core/app_format_string.dart';
import 'package:digi_patient/core/colors.dart';
import 'package:digi_patient/core/text_styles.dart';
import 'package:digi_patient/core/widgets/app_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:digi_patient/feature/home/data/model/doctor_model.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../core/images.dart';
import '../../core/sizes.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Doctor image background,
          Column(
            children: [
              Hero(
                tag: doctor.name,
                child: AppCachedNetworkImage(
                  url: doctor.image,
                  height: AppSizes.height(context, 300),
                  width: double.infinity,
                  radius: 0,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  color: AppColors.white,
                ),
              )
            ],
          ),

          // Overlay stats (experience, rating, patients)
          Positioned(
            top: AppSizes.height(context, 170),
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard(context, HugeIcons.strokeRoundedStethoscope02, "${doctor.experience} yrs", "Experience"),
                _buildStatCard(context, HugeIcons.strokeRoundedStar, "${doctor.rating} (${doctor.totalReview})", "Rating"),
                _buildStatCard(context, HugeIcons.strokeRoundedUserGroup02, "${doctor.patientsServed}+", "Patients"),
              ],
            ),
          ),

          // buttons
          Positioned(
            top: AppSizes.paddingBody * 2,
            left: AppSizes.paddingBody,
            right: AppSizes.paddingBody,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.filledTonal(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: const CircleBorder(),
                  ),
                  icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowLeft01,
                    color: AppColors.primary,
                    size: AppSizes.iconBig,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                ValueListenableBuilder(
                  valueListenable: doctor.isFavorite,
                  builder: (_, value, _) {
                    return IconButton.filledTonal(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(AppColors.white),
                        shape: WidgetStatePropertyAll(const CircleBorder()),
                      ),
                      onPressed: () {
                        doctor.isFavorite.value = !value;
                      }, icon: Icon(value ? Icons.favorite : Icons.favorite_border, color: AppColors.primary,),);
                  }
                )
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: AppSizes.height(context, 570),
              width: double.infinity,
              padding: EdgeInsets.all(AppSizes.paddingBody),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.radiusBig),
                  topRight: Radius.circular(AppSizes.radiusBig),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Top handle
                  Container(
                    width: 60,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: AppSizes.paddingInside),
                    decoration: BoxDecoration(
                      color: AppColors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(AppSizes.radiusBig),
                    ),
                  ),

                  // Doctor Name & Specialty
                  Text(
                    doctor.name,
                    style: AppTextStyles.titleBold.copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    doctor.speciality,
                    style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.lightText.withValues(alpha: 0.7),
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  // Qualifications
                  const SizedBox(height: AppSizes.paddingInside),
                  Container(
                    padding: const EdgeInsets.all(AppSizes.paddingInside),
                    decoration: BoxDecoration(
                      color: AppColors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.qualifications.join(' • '),
                          style: AppTextStyles.body.copyWith(color: AppColors.lightText.withValues(alpha: 0.5)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // Description
                  const SizedBox(height: AppSizes.paddingInside),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            doctor.description,
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Payment & Fee Section
                  const SizedBox(height: AppSizes.paddingInside),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppSizes.paddingInside),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                      border: Border.all(color: AppColors.grey.withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Fee info
                        Row(
                          children: [
                            Text("Consultation Fee", style: AppTextStyles.subtitle),
                            Spacer(),
                            Text(
                              "${formatCurrency(doctor.fees)}",
                              style: AppTextStyles.title.copyWith(color: AppColors.primary),
                            ),
                            Text("/session")
                          ],
                        ),
                        const Divider(thickness: 0.5),
                        Row(
                          children: [
                            Image.asset(AppImages.bkash, height: AppSizes.iconBig),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bkash Send Money",
                                  style: AppTextStyles.body.copyWith(color: AppColors.grey),
                                ),
                                const SizedBox(height: AppSizes.paddingInside / 2),
                                Row(
                                  children: [
                                    Text(
                                      "01817-184032",
                                      style: AppTextStyles.subtitle
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingInside / 2, horizontal: AppSizes.paddingInside * 2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.primary),
                                  borderRadius: BorderRadius.circular(AppSizes.radiusSmall / 2),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Support",
                                      style: AppTextStyles.subtitle.copyWith(color: AppColors.primary),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.paddingInside,),
                  //? Book Appointment Button,
                  Row(
                    children: [
                      Expanded(child: FilledButton(onPressed: (){}, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: AppSizes.paddingInside,
                        children: [
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedCalendar03,
                            color: AppColors.white,
                            size: AppSizes.iconSmall,
                          ),
                          Text("Book Now"),
                        ],
                      ))),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, IconData icon, String value, String label) {
    return Container(
      height: AppSizes.height(context, 90),
      width: AppSizes.height(context, 100),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HugeIcon(
            icon: icon,
            color: AppColors.primary,
            size: AppSizes.iconBig,
          ),
          SizedBox(height: AppSizes.paddingInside),
          Text(value, style: AppTextStyles.bodyBold),
          Text(label, style: AppTextStyles.body),
        ],
      ),
    );
  }
}