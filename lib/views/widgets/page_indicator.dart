import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final double? dotSize;
  final double? spacing;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.dotSize,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: spacing ?? 4),
          width: index == currentPage ? (dotSize ?? 8) * 2 : (dotSize ?? 8),
          height: dotSize ?? 8,
          decoration: BoxDecoration(
            color: index == currentPage
                ? AppColors.primaryBlue
                : AppColors.inactiveIndicator,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
