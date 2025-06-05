import 'package:digi_patient/feature/home/data/data_source/fetch_specilities_list.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/sizes.dart';
import '../../../core/text_styles.dart';

class DoctorSpecialityWidget extends StatefulWidget {
  const DoctorSpecialityWidget({super.key});

  @override
  State<DoctorSpecialityWidget> createState() => _DoctorSpecialityWidgetState();
}

class _DoctorSpecialityWidgetState extends State<DoctorSpecialityWidget> {
  final ValueNotifier<String> speciality = ValueNotifier<String>(fetchSpecialitiesList().first);

  @override
  void dispose() {
    speciality.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.paddingInside,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
          child: Text('Doctor Speciality', style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w600),),
        ),
        SizedBox(
          height: AppSizes.height(context, 40),
          child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(width: AppSizes.paddingInside,),
            itemCount: fetchSpecialitiesList().length + 1,
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) => ValueListenableBuilder(
              valueListenable: speciality,
              builder: (_, value, _) {
                return index == 0 ? const SizedBox(width: AppSizes.paddingInside,) : InkWell(
                  splashColor: Colors.transparent,
                  onTap: () => speciality.value = fetchSpecialitiesList()[index - 1],
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingInside),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppSizes.radiusBig),
                      border: Border.all(color: speciality.value == fetchSpecialitiesList()[index - 1] ? AppColors.primary : AppColors.grey.withValues(alpha: 0.5))
                    ),
                    child: Center(child: Text(fetchSpecialitiesList()[index - 1], style: AppTextStyles.bodyBold.copyWith(color: speciality.value == fetchSpecialitiesList()[index - 1] ? AppColors.primary : AppColors.grey.withValues(alpha: 0.5)),)),
                  ),
                );
              }
            ),
          ),
        )
      ],
    );
  }
}