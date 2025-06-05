
import 'package:digi_patient/core/widgets/app_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/app_format_string.dart';
import '../../../core/colors.dart';
import '../../../core/sizes.dart';
import '../../../core/text_styles.dart';
import '../data/data_source/fetch_upcoming_schedule_list.dart';

class UpcomingScheduleWidget extends StatefulWidget {
  const UpcomingScheduleWidget({
    super.key,
  });

  @override
  State<UpcomingScheduleWidget> createState() => _UpcomingScheduleWidgetState();
}

class _UpcomingScheduleWidgetState extends State<UpcomingScheduleWidget> {
  final ValueNotifier<int> pageIndex = ValueNotifier<int>(0);
  @override
  void dispose() {
    pageIndex.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.paddingInside,
      children: [
        //! Content,
        SizedBox(
          height: AppSizes.height(context, 220),
          child: PageView.builder(
            itemCount: fetchUpcomingScheduleList().length,
            onPageChanged: (value) => pageIndex.value = value,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final upcomingSchedule = fetchUpcomingScheduleList()[index];
              return Container(
                margin: const EdgeInsets.all(AppSizes.paddingInside),
                padding: const EdgeInsets.all(AppSizes.paddingInside),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryG,
                      AppColors.primary,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.radiusBig)
                ),
                child: Column(
                  spacing: AppSizes.paddingInside,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //! header
                    Row(
                      spacing: AppSizes.paddingInside,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //? Image of doctor 
                        Expanded(
                          child: Row(
                            spacing: AppSizes.paddingInside,
                            children: [
                              Container(
                                padding: EdgeInsets.all(AppSizes.paddingMini),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(AppSizes.radiusSmall)
                                ),
                                child: AppCachedNetworkImage(url: upcomingSchedule.doctor.image, radius: AppSizes.radiusSmall, isPerson: true,)
                              ),
                              //? doctor details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: AppSizes.paddingInside / 2,
                                  children: [
                                    Text(upcomingSchedule.doctor.name, style: AppTextStyles.title.copyWith(color: AppColors.white), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                    Row(
                                      spacing: AppSizes.paddingInside / 2,
                                      children: [
                                        Text(upcomingSchedule.doctor.speciality, style: AppTextStyles.body.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),),
                                        SizedBox(width: AppSizes.paddingInside / 2,),
                                        HugeIcon(
                                          icon: HugeIcons.strokeRoundedStethoscope02,
                                          color: AppColors.white,
                                          size: AppSizes.iconSmall,
                                        ),
                                        Text("${upcomingSchedule.doctor.experience.toInt()} Years", style: AppTextStyles.body.copyWith(color: AppColors.white),),
                                      ],
                                    ),
                                    //? remaining time,
                                    Container(
                                      padding: const EdgeInsets.all(AppSizes.paddingInside / 2),
                                      decoration: BoxDecoration(
                                        color: AppColors.white.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(AppSizes.radiusBig)
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        spacing: AppSizes.paddingInside / 2,
                                        children: [
                                          HugeIcon(
                                            icon: HugeIcons.strokeRoundedClock01,
                                            color: AppColors.white,
                                            size: AppSizes.iconSmall,
                                          ),
                                          Text("Starts in ${formatRemainingTime(upcomingSchedule.remainingTime)}", style: AppTextStyles.body.copyWith(color: AppColors.white),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //? menu button
                        IconButton(
                          onPressed: (){}, 
                          icon: HugeIcon(
                            icon: HugeIcons.strokeRoundedMoreVertical,
                            color: AppColors.white,
                            size: AppSizes.iconBig,
                          ),
                        )
                      ],
                    ),
                    //! Price and join call,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${formatCurrency(upcomingSchedule.doctor.fees)}", style: AppTextStyles.title.copyWith(color: AppColors.white),),
                        Text("/session", style: AppTextStyles.body.copyWith(color: AppColors.white),),
                        Spacer(),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusBig))
                          ),
                          onPressed: (){}, 
                          icon: HugeIcon(
                            icon: HugeIcons.strokeRoundedVideo01,
                            color: AppColors.primary,
                            size: AppSizes.iconBig,
                          ), 
                          label: Text("Join Call", style: AppTextStyles.body.copyWith(color: AppColors.primary),),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          )
        ),

        //! Pagination,
        ValueListenableBuilder<int>(
          valueListenable: pageIndex,
          builder: (_, value, __) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(fetchUpcomingScheduleList().length, (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingInside / 3),
              width: index == value ? 30 : AppSizes.paddingInside / 2,
              height: 5,
              decoration: BoxDecoration(
                color: index == value ? AppColors.primary : AppColors.primary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall)
              ),
            )),
          ),
        ),
      ],
    );
  }
}
