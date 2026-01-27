import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class AppLogoHeader extends StatelessWidget {
  final double? logoSize;
  final double? fontSize;
  final EdgeInsets? padding;

  const AppLogoHeader({
    super.key,
    this.logoSize,
    this.fontSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // Logo Image
          Image.asset(
            'assets/images/app_logo.png',
            width: logoSize ?? 100,
            height: logoSize ?? 100,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: logoSize ?? 100,
                height: logoSize ?? 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryBlue, AppColors.accentBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(
                  Icons.shield,
                  color: Colors.white,
                  size: 50,
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          // App Name
          Text(
            "INSPECTOR'S PATH",
            style: TextStyle(
              fontSize: fontSize ?? 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
