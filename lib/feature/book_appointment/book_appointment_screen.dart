import 'package:digi_patient/core/widgets/app_cached_network_image.dart';
import 'package:digi_patient/core/widgets/app_scaffold.dart';
import 'package:digi_patient/feature/home/data/model/doctor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../core/app_format_string.dart';
import '../../core/colors.dart';
import '../../core/sizes.dart';
import '../../core/text_styles.dart';
class BookAppointmentScreen extends StatelessWidget {
  BookAppointmentScreen({super.key, required this.doctor});
  final DoctorModel doctor;

  final ValueNotifier<String> _appointmentMode = ValueNotifier<String>('Online');
  final ValueNotifier<DateTime> _selectedDate = ValueNotifier<DateTime>(DateTime.now());
  final ValueNotifier<String?> _selectedTime = ValueNotifier<String?>(null); // For time selection

  dispose() {
    _appointmentMode.dispose();
    _selectedDate.dispose();
    _selectedTime.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingBody),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.paddingBody,
          children: [
            //? Doctor Details
            _buildDoctorInfo(context),

            //? Appointment Mode Selector
            _buildAppointmentModeSelector(),

            //? Date Picker
            _buildDatePicker(context),

            //? Time Selector
            Column(
              spacing: AppSizes.paddingInside,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Available Time', style: AppTextStyles.subtitle),
                Container(
                  padding: EdgeInsets.all(AppSizes.paddingInside),
                  decoration: BoxDecoration(
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
                  child: Row(
                    children: [
                      Expanded(
                        child: TimeSlotSection(
                          title: 'Morning',
                          timeSlots: ['09:00 AM', '09:30 AM', '10:00 AM'],
                          selectedTime: _selectedTime,
                        ),
                      ),
                      SizedBox(height: AppSizes.paddingInside),
                      Expanded(
                        child: TimeSlotSection(
                          title: 'Afternoon',
                          timeSlots: ['01:00 PM', '01:30 PM', '02:00 PM'],
                          selectedTime: _selectedTime,
                        ),
                      ),
                      SizedBox(height: AppSizes.paddingInside),
                      Expanded(
                        child: TimeSlotSection(
                          title: 'Evening',
                          timeSlots: ['06:00 PM', '06:30 PM', '07:00 PM'],
                          selectedTime: _selectedTime,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //! Upload report,
            Container(
              padding: const EdgeInsets.all(AppSizes.paddingInside),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: AppSizes.paddingInside,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedFileAttachment,
                    color: AppColors.primary,
                    size: AppSizes.iconSmall,
                  ),
                  Text('Upload Report', style: AppTextStyles.subtitle,)
                ],
              ),
            ),
            Spacer(),

            //? Book Appointment Button
            Row(
              children: [
                Expanded(child: FilledButton(onPressed: () {}, child: Text('Book Appointment', style: AppTextStyles.body.copyWith(color: AppColors.white)))),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingInside),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppSizes.radiusBig),
      ),
      child: Row(
        children: [
          Hero(
            tag: doctor.name,
            child: AppCachedNetworkImage(
              url: doctor.image,
              height: AppSizes.height(context, 80),
              width: AppSizes.height(context, 80),
              radius: AppSizes.radiusSmall,
            ),
          ),
          SizedBox(width: AppSizes.paddingInside),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name, style: AppTextStyles.bodyBold),
                Text(doctor.speciality, style: AppTextStyles.body),
                SizedBox(height: AppSizes.paddingInside),
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedStethoscope02,
                      color: AppColors.lightText,
                      size: AppSizes.iconBig / 2,
                    ),
                    SizedBox(width: 4),
                    Text("${doctor.experience.toInt()} Years", style: AppTextStyles.body.copyWith(color: AppColors.lightText)),
                    SizedBox(width: 8),
                    Icon(Icons.star, size: AppSizes.iconSmall, color: AppColors.primary),
                    SizedBox(width: 2),
                    Text(doctor.rating.toString(), style: AppTextStyles.bodyBold.copyWith(color: AppColors.lightText)),
                    SizedBox(width: 4),
                    Text("(${doctor.totalReview})", style: AppTextStyles.body.copyWith(color: AppColors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentModeSelector() {
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder<String>(
            valueListenable: _appointmentMode,
            builder: (context, value, _) {
              return CupertinoSlidingSegmentedControl<String>(
                groupValue: value,
                backgroundColor: AppColors.grey.withValues(alpha: 0.1),
                thumbColor: AppColors.white,
                children: {
                  'Online': Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingBody, vertical: AppSizes.paddingInside),
                    child: Text('Online', style: AppTextStyles.bodyBold.copyWith(color: value == 'Online' ? AppColors.primary : AppColors.grey)),
                  ),
                  'Offline': Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingBody, vertical: AppSizes.paddingInside),
                    child: Text('Offline', style: AppTextStyles.bodyBold.copyWith(color: value == 'Offline' ? AppColors.primary : AppColors.grey)),
                  ),
                },
                onValueChanged: (selected) {
                  if (selected != null) _appointmentMode.value = selected;
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Schedule Date', style: AppTextStyles.subtitle),
        SizedBox(height: AppSizes.paddingInside),
        SizedBox(
          height: AppSizes.height(context, 80),
          child: ValueListenableBuilder<DateTime>(
            valueListenable: _selectedDate,
            builder: (context, selectedDate, _) {
              final now = DateTime.now();

              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (_, __) => SizedBox(width: AppSizes.paddingInside),
                itemBuilder: (context, index) {
                  final date = now.add(Duration(days: index));
                  final isSelected = selectedDate.year == date.year &&
                      selectedDate.month == date.month &&
                      selectedDate.day == date.day;

                  return GestureDetector(
                    onTap: () => _selectedDate.value = date,
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        gradient: isSelected
                            ? LinearGradient(colors: [AppColors.primaryG, AppColors.primary], begin: Alignment.topLeft, end: Alignment.bottomRight)
                            : null,
                        borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingInside / 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: AppSizes.paddingInside / 2,
                        children: [
                          Text(formatMonth(date), style: AppTextStyles.body.copyWith(color: isSelected ? AppColors.white : AppColors.lightText)),
                          Text(formatDay(date), style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w900, color: isSelected ? AppColors.white : AppColors.lightText)),
                          Text(formatWeekday(date), style: AppTextStyles.body.copyWith(color: isSelected ? AppColors.white : AppColors.grey)),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}


class TimeSlotSection extends StatelessWidget {
  final String title;
  final List<String> timeSlots;
  final ValueNotifier<String?> selectedTime;

  const TimeSlotSection({
    super.key,
    required this.title,
    required this.timeSlots,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.paddingInside / 2,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.paddingInside),
          decoration: BoxDecoration(
            color: AppColors.grey.withValues(alpha: 0.1),
            // borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
          ),
          child: Text(title, style: AppTextStyles.bodyBold, textAlign: TextAlign.center),
        ),
        Column(
          spacing: AppSizes.paddingInside,
          children: timeSlots.map((time) {
            return ValueListenableBuilder<String?>(
              valueListenable: selectedTime,
              builder: (context, selected, _) {
                final isSelected = selected == time;
                return GestureDetector(
                  onTap: () => selectedTime.value = time,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.grey.withValues(alpha: 0.03),
                      borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                    ),
                    child: Text(
                      time,
                      style: AppTextStyles.body.copyWith(
                        color: isSelected ? AppColors.white : AppColors.lightText,
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
