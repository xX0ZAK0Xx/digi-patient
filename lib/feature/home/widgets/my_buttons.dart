import 'package:digi_patient/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/colors.dart';
import '../../../core/text_styles.dart';

class MyButtons extends StatelessWidget {
  const MyButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
      child: Row(
        spacing: AppSizes.paddingInside,
        children: [
          Expanded(child: GradientButton(title: 'My Doctor', onTap: () {}, icon: HugeIcons.strokeRoundedStethoscope02)),
          Expanded(child: GradientButton(title: 'My Clinic', onTap: () {}, icon: HugeIcons.strokeRoundedHospitalLocation,)),
          Expanded(child: GradientButton(title: 'My Medicine', onTap: () {}, icon: HugeIcons.strokeRoundedMedicine02,)),
        ],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.title, required this.onTap, required this.icon});
  final String title;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: AppSizes.height(context, 80),
        padding: EdgeInsets.all(AppSizes.paddingInside),
        decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [AppColors.white, AppColors.lightBg], begin: Alignment.topLeft, end: Alignment.bottomRight),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(icon: icon, color: AppColors.primary, size: AppSizes.iconBig,),
            SizedBox(height: AppSizes.paddingInside,),
            Text(title, style: AppTextStyles.body,)
          ],
        ),
      ),
    );
  }
}