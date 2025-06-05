
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/colors.dart';
import '../../../core/images.dart';
import '../../../core/sizes.dart';
import '../../../core/text_styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.circleAvatarRadius),
      child: Row(
        spacing: AppSizes.paddingInside,
        children: [
          //! Profile,
          CircleAvatar(
            radius: AppSizes.circleAvatarRadius,
            backgroundImage: AssetImage(AppImages.profile),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back!", style: AppTextStyles.subtitle,),
              Text(
                "Ahsan Habib", 
                style: AppTextStyles.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis
              )
            ],
          )),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.white,
              shape: const CircleBorder(),
            ),
            onPressed: (){}, icon: Padding(
              padding: EdgeInsets.all(AppSizes.paddingInside / 2),
              child: Stack(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedNotification03,
                    color: AppColors.primary,
                    size: AppSizes.iconBig,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(AppSizes.paddingInside / 2),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle
                      ),
                    ),
                  )
                ],
              )
          ))
        ],
      ),
    );
  }
}