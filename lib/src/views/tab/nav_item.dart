import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.isActive, required this.assetURL});
  final bool isActive;
  final String assetURL;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 36.0,
      width: 36.0,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor: null, 
        borderRadius: BorderRadius.circular(34.0)
      ),
      child: SvgPicture.asset(
        assetURL,
        fit: BoxFit.scaleDown,
        height: 24.0,
        width: 24.0,
        colorFilter: isActive
            ? const ColorFilter.mode(kTabColor, BlendMode.srcIn)
            : null,
      ),
    );
  }
}
