import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    bool centerTitle = true,
    bool showLogo = true,
    required String title,
  }) : super(
          leading: !showLogo
              ? null
              : Container(
                  margin: const EdgeInsets.only(left: commonWidth),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
          leadingWidth: logoWidth + commonWidth,
          centerTitle: centerTitle,
          title: Text(title),
        );
}
