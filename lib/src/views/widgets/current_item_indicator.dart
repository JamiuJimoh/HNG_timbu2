import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

// used to indicate how many items are on the PageView, and also
// the current item being shown in the viewport.
class CurrentItemIndicator extends StatelessWidget {
  const CurrentItemIndicator({super.key, required this.isCurrentPage});
  final bool isCurrentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12.0,
      width: 12.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? kPrimaryColor : kBGColor,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isCurrentPage ? kPrimaryColor : const Color(0xFFBBBBBB),
        ),
      ),
    );
  }
}
