import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../utils/app_colors.dart';
import '../widgets/gradient_background.dart';
import '../widgets/app_logo_header.dart';
import '../widgets/otp_input_field.dart';
import '../widgets/primary_button.dart';

class VerifyOtpScreen extends ConsumerStatefulWidget {
  final String? email;
  final bool isForPasswordReset;

  const VerifyOtpScreen({
    super.key,
    this.email,
    this.isForPasswordReset = false,
  });

  @override
  ConsumerState<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                // Logo and App Name
                const AppLogoHeader(),

                const SizedBox(height: 60),

                // Title
                const Text(
                  'Enter OTP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 40),

                // OTP Input Field
                OtpInputField(
                  length: 6,
                  onChanged: (value) {
                  
                  },
                  onCompleted: (value) {
          
                  },
                ),

                const SizedBox(height: 24),

                // Resend OTP
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't Receive OTP? ",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap:() async {
                      },
                      child: const Text(
                        'RESEND OTP',
                        style: TextStyle(
                          color: AppColors.textLink,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Verify Now Button
                PrimaryButton(
                  text: 'Verify Now',
                  onPressed:() async {
                  },
                  isLoading: false,
                  useGradient: true,
                  borderRadius: 30,
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
