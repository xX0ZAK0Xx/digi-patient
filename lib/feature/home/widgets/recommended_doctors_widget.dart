import 'package:digi_patient/feature/all_doctor/data/fetch_doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/colors.dart';
import '../../../core/sizes.dart';
import '../../../core/text_styles.dart';
import '../../../core/widgets/app_cached_network_image.dart' show AppCachedNetworkImage;
import '../../all_doctor/all_doctor_screen.dart';

class RecommendedDoctorsWidget extends StatelessWidget {
  const RecommendedDoctorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = fetchDoctorsList().take(5).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.paddingInside,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Recommended Doctors', style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w600),),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AllDoctorScreen())),
                child: Text('See All', style: AppTextStyles.bodyBold.copyWith(color: AppColors.primary),))
            ],
          ),        
        ),
        ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(height: AppSizes.paddingInside,),
          shrinkWrap: true,
          itemCount: doctors.length,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return Container(
              padding: EdgeInsets.all(AppSizes.paddingInside),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSizes.radiusBig),
                // border: Border.all(color: AppColors.g,rey.withValues(alpha: 0.1))
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    blurRadius: 8,
                    // spreadRadius: 1
                  )
                ]
              ),
              child: Row(
                spacing: AppSizes.paddingInside,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppCachedNetworkImage(
                    url: doctor.image, 
                    radius: AppSizes.radiusSmall, 
                    isPerson: true,
                    height: AppSizes.height(context, 70),
                    width: AppSizes.height(context, 70),
                  ),
                  //? doctor details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doctor.name, style: AppTextStyles.title.copyWith(color: AppColors.lightText), maxLines: 1, overflow: TextOverflow.ellipsis,),
                        Row(
                          spacing: AppSizes.paddingInside / 2,
                          children: [
                            Text(doctor.speciality, style: AppTextStyles.body.copyWith(color: AppColors.lightText, fontWeight: FontWeight.bold),),
                            SizedBox(width: AppSizes.paddingInside / 2,),
                            HugeIcon(
                              icon: HugeIcons.strokeRoundedStethoscope02,
                              color: AppColors.lightText,
                              size: AppSizes.iconSmall,
                            ),
                            Text("${doctor.experience.toInt()} Years", style: AppTextStyles.body.copyWith(color: AppColors.lightText),),
                          ],
                        ),
                        SizedBox(height: AppSizes.paddingInside / 2,),
                        //!Ratings
                        Row(
                          spacing: AppSizes.paddingInside / 2,
                          children: [
                            HugeIcon(
                              icon: Icons.star,
                              color: AppColors.primary,
                              size: AppSizes.iconSmall,
                            ),
                            Text(doctor.rating.toString(), style: AppTextStyles.bodyBold.copyWith(color: AppColors.lightText),),
                            Text("(${doctor.totalReview.toString()})", style: AppTextStyles.bodyBold.copyWith(color: AppColors.grey),),
                          ],
                        )
                      ],
                    ),
                  )
                ]
              ),
            );
          },
        ),
      ],
    );
  }
}