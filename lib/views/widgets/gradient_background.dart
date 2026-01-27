import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final bool useImage;

  const GradientBackground({
    super.key,
    required this.child,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.useImage = true,
  });

  @override
  Widget build(BuildContext context) {
    if (useImage) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backdown.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      );
    }
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [
            AppColors.backgroundGradientStart,
            AppColors.backgroundGradientEnd,
          ],
        ),
      ),
      child: child,
    );
  }
}
