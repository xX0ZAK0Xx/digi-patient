import 'package:digi_patient/core/widgets/app_input_widget.dart';
import 'package:flutter/material.dart';

import '../../core/sizes.dart';
import '../../core/text_styles.dart';

class AddDoctorBottomSheet extends StatefulWidget {
  const AddDoctorBottomSheet({super.key});

  @override
  State<AddDoctorBottomSheet> createState() => _AddDoctorBottomSheetState();
}

class _AddDoctorBottomSheetState extends State<AddDoctorBottomSheet> {
  final TextEditingController _doctorIdController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Autofocus when sheet opens
    Future.delayed(Duration(milliseconds: 100), () {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _doctorIdController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onAddDoctor() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(AppSizes.paddingBody),
      height: AppSizes.height(context, 450),
      child: Column(
        children: [
          Text(
            'Add Doctor',
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: AppSizes.paddingBody),
          AppTextField(
            keyboardType: TextInputType.number,
            prefixIcon: SizedBox(
              height: AppSizes.height(context, 40),
              width: AppSizes.height(context, 40),
              child: Center(
                child: Text(
                  "DC -",
                  style: AppTextStyles.subtitle,
                ),
              ),
            ),
            hintText: "1234",
            labelText: "Doctor ID",
            controller: _doctorIdController,
            focusNode: _focusNode,
            autofocus: true,
            maxLine: 1,
            onChanged: (value) {
              if (value.length > 4) {
                _doctorIdController.text = value.substring(0, 4);
                _doctorIdController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _doctorIdController.text.length),
                );
              }
            },
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: _onAddDoctor,
                  child: Text("Add Doctor"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
