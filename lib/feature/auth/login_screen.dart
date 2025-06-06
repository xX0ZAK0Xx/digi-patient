import 'package:digi_patient/core/sizes.dart';
import 'package:digi_patient/core/widgets/app_input_widget.dart';
import 'package:digi_patient/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../core/text_styles.dart';
import '../../core/colors.dart';
import '../root.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final PhoneController? _phoneController = createPhoneController("");

  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _obscureNotifier = ValueNotifier(true);

  final ValueNotifier<bool> _rememberMe = ValueNotifier(false);

  @override
  void dispose() {
    _phoneController?.dispose();
    _passwordController.dispose();
    _obscureNotifier.dispose();
    _rememberMe.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.paddingBody),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi! Welcome Back", style: AppTextStyles.title),
                const SizedBox(height: AppSizes.paddingBody * 2),

                /// Phone Number
                AppPhoneFormField(
                  labelText: "Phone Number",
                  controller: _phoneController,
                ),
                const SizedBox(height: AppSizes.paddingInside),

                /// Password
                ValueListenableBuilder<bool>(
                  valueListenable: _obscureNotifier,
                  builder: (context, isObscure, _) {
                    return AppTextField(
                      hintText: "Enter your password",
                      labelText: "Password",
                      controller: _passwordController,
                      obscureText: isObscure,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? HugeIcons.strokeRoundedViewOff : HugeIcons.strokeRoundedView,
                          color: AppColors.primary,
                          size: AppSizes.iconSmall,
                        ),
                        onPressed: () {
                          _obscureNotifier.value = !isObscure;
                        },
                      ),
                    );
                  },
                ),

                /// Remember Me & Forgot Password
                Row(
                  children: [
                    SizedBox(
                      height: AppSizes.iconBig,
                      width: AppSizes.iconBig,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _rememberMe,
                        builder: (context, isChecked, _) {
                          return Checkbox(
                            value: isChecked,
                            activeColor: AppColors.primary,
                            onChanged: (value) {
                              _rememberMe.value = value ?? false;
                            },
                            side: BorderSide(width: 0.5),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: AppSizes.paddingInside / 2,),
                    const Text("Remember Me"),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.paddingBody),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Root()), (_) => false);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: AppSizes.paddingBody),

                /// Create Account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Handle navigation to register
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

PhoneController? createPhoneController(String? fullPhoneNumber) {
  if(fullPhoneNumber == null) return null;
  try {
    final parsedPhoneNumber = PhoneNumber.parse(fullPhoneNumber);
    final isoCode = parsedPhoneNumber.isoCode;
    final nsn = parsedPhoneNumber.nsn;

    return PhoneController(
      initialValue: PhoneNumber(
        isoCode: isoCode,
        nsn: nsn,
      ),
    );
  } catch (e) {
    return null;
  }
}