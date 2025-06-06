import 'package:digi_patient/core/colors.dart';
import 'package:digi_patient/core/widgets/app_cached_network_image.dart';
import 'package:digi_patient/feature/all_doctor/data/fetch_doctors_list.dart';
import 'package:digi_patient/feature/home/widgets/doctor_speciality_widget.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../core/sizes.dart';
import '../../core/text_styles.dart';
import '../../core/widgets/app_scaffold.dart';
import '../details/doctor_details_screen.dart';
import '../home/widgets/search_widget.dart';

class AllDoctorScreen extends StatelessWidget {
  const AllDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Column(
          spacing: AppSizes.paddingBody,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Search,
            const SizedBox(height: AppSizes.paddingBody,),
            IgnorePointer(child: SearchWidget()),
            DoctorSpecialityWidget(showTitle: false,),
            Expanded(
              child: ListView(
                children: [
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: fetchDoctorsList().length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.65),
                    itemBuilder: (context, index) {
                      final doctor = fetchDoctorsList()[index];
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: AppSizes.paddingBody,
                          right: index&1 == 0 ? AppSizes.paddingBody : 0
                        ),
                        padding: EdgeInsets.all(AppSizes.paddingInside),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(AppSizes.radiusBig),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 2)
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                //! Photo
                                AppCachedNetworkImage(url: doctor.image, isPerson: true, height: AppSizes.height(context, 120), width: double.maxFinite, radius: AppSizes.radiusSmall,),
                                //! black gradient,
                                // Positioned.fill(
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //       gradient: LinearGradient(
                                //         colors: [
                                //           Colors.black.withValues(alpha: 0.05),
                                //           Colors.black.withValues(alpha: 0.3),
                                //         ],
                                //         begin: Alignment.topRight,
                                //         end: Alignment.bottomLeft,
                                //       ),
                                //       borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                                //     ),
                                //   ),
                                // ),
                                // //! Price,
                                // Positioned(
                                //   bottom: AppSizes.paddingInside,
                                //   left: AppSizes.paddingInside,
                                //   child: Text("${formatCurrency(doctor.fees)}", style: AppTextStyles.subtitle.copyWith(color: AppColors.white, fontWeight: FontWeight.w900),),
                                // ),
                                //! Favourite
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: ValueListenableBuilder(
                                    valueListenable: doctor.isFavorite,
                                    builder: (_, value, _) {
                                      return IconButton.filledTonal(
                                        style: ButtonStyle(
                                          backgroundColor: WidgetStatePropertyAll(AppColors.primary.withValues(alpha: 0.1)),
                                          shape: WidgetStatePropertyAll(const CircleBorder()),
                                        ),
                                        onPressed: () {
                                          doctor.isFavorite.value = !value;
                                        }, icon: Icon(value ? Icons.favorite : Icons.favorite_border, color: AppColors.white,),);
                                    }
                                  )
                                ),
                              ],
                            ),
                            SizedBox(height: AppSizes.paddingInside,),
                            //? Name
                            Text(doctor.name, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),),
                            //? Speciality,
                            Text(doctor.speciality, style: AppTextStyles.body.copyWith(color: AppColors.grey),),
                            SizedBox(height: AppSizes.paddingInside / 2,),
                            //? Exp and Ratings,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HugeIcon(
                                  icon: HugeIcons.strokeRoundedStethoscope02,
                                  color: AppColors.lightText,
                                  size: AppSizes.iconBig / 2,
                                ),
                                Text("${doctor.experience.toInt()} Years", style: AppTextStyles.body.copyWith(color: AppColors.lightText),),
                                SizedBox(width: AppSizes.paddingInside / 2,),
                                HugeIcon(
                                  icon: Icons.star,
                                  color: AppColors.primary,
                                  size: AppSizes.iconSmall,
                                ),
                                Text(doctor.rating.toString(), style: AppTextStyles.bodyBold.copyWith(color: AppColors.lightText),),
                                SizedBox(width: AppSizes.paddingInside / 3,),
                                Text("(${doctor.totalReview.toString()})", style: AppTextStyles.bodyBold.copyWith(color: AppColors.grey),),
                              ],
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetailsScreen(doctor: doctor))),
                              child: Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.all(AppSizes.paddingInside),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(AppSizes.radiusSmall)
                                ),
                                child: Text('Book Now', style: AppTextStyles.bodyBold.copyWith(color: AppColors.primary),textAlign: TextAlign.center,),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}