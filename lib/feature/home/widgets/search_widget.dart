
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/colors.dart';
import '../../../core/sizes.dart';
import '../../../core/text_styles.dart';
class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
      child: Row(
        spacing: AppSizes.paddingInside,
        children: [
          Expanded(
            child: Container(
              // margin: const EdgeInsets.all(AppSizes.paddingBody),
              padding: const EdgeInsets.all(AppSizes.paddingInside),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSizes.radiusBig)
              ),
              child: Row(
                spacing: AppSizes.paddingInside,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedSearch01,
                    color: AppColors.primary,
                    size: AppSizes.iconBig,
                  ),
                  Text('Search...', style: AppTextStyles.body.copyWith(color: AppColors.grey),)
                ],
              ),
            ),
          ),
      
          //! Filter,
          Container(
            padding: const EdgeInsets.all(AppSizes.paddingInside),
            decoration: BoxDecoration(
              color: AppColors.white,
              // borderRadius: BorderRadius.circular(AppSizes.radiusBi,g)
              shape: BoxShape.circle
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedPreferenceVertical,
              color: AppColors.primary,
              size: AppSizes.iconBig,
            ),
          ),
        ],
      ),
    );
  }
}
