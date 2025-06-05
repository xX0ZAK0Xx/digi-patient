import 'package:digi_patient/core/sizes.dart';
import 'package:digi_patient/feature/home/home_screen.dart';
import 'package:digi_patient/feature/medicine/medicine_screen.dart';
import 'package:digi_patient/feature/recources/resources_screen.dart';
import 'package:digi_patient/feature/profile/profile_screen.dart';
import 'package:digi_patient/feature/qr_code/qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../core/colors.dart';
import '../core/widgets/app_scaffold.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final ValueNotifier<int> pageIndex = ValueNotifier<int>(0);
  final List<Widget> screens = [
    HomeScreen(),
    MedicineScreen(),
    QrCodeScreen(),
    ResourcesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (_, value, __) => screens[value],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.5),
              blurRadius: 10,
            ),
          ],
        ),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => pageIndex.value = 2,
          backgroundColor: AppColors.primary,
          elevation: 0,
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedQrCode,
            color: AppColors.white,
            size: AppSizes.iconBig,
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (_, value, __) {
          return Container(
            padding: EdgeInsets.all(AppSizes.paddingBody),
            decoration: BoxDecoration(
              color: AppColors.lightBgBottomNav,
              border: const Border(
                top: BorderSide(color: Colors.white, width: 1.5),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  blurRadius: 10,
                  // spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationButton(
                  icon: HugeIcons.strokeRoundedHome04,
                  isSelected: value == 0,
                  onTap: () => pageIndex.value = 0,
                ),
                BottomNavigationButton(
                  icon: HugeIcons.strokeRoundedMedicine02,
                  isSelected: value == 1,
                  onTap: () => pageIndex.value = 1,
                ),
                const SizedBox(width: 56), // Space for FAB (matches clipper)
                BottomNavigationButton(
                  icon: HugeIcons.strokeRoundedLibraries,
                  isSelected: value == 3,
                  onTap: () => pageIndex.value = 3,
                ),
                BottomNavigationButton(
                  icon: HugeIcons.strokeRoundedUser,
                  isSelected: value == 4,
                  onTap: () => pageIndex.value = 4,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({super.key, required this.icon, required this.isSelected, required this.onTap});

  final IconData icon;
  // final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            height: 3,
            width: isSelected ? 20 : 0,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppSizes.radiusSmall)
            ),
          ),
          SizedBox(
            height: AppSizes.paddingInside / 2,
          ),
          HugeIcon(
            icon: icon,
            color: isSelected ? AppColors.primary : AppColors.primary.withValues(alpha: 0.3),
            size: AppSizes.iconBig,
          ),
        ],
      ),
    );
  }
}