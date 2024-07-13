import 'package:flutter/material.dart';
import 'package:timbu/src/utils/app_colors.dart';

class Adder extends StatelessWidget {
  const Adder({super.key, required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final activeColor =onTap==null? kTabColor.withOpacity(0.5): kTabColor;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20.0,
        width: 20.0,
        decoration: BoxDecoration(
          border: Border.all(color:activeColor),
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: Center(
          child: Icon(icon, color: activeColor, size: 14.0),
        ),
      ),
    );
  }
}

