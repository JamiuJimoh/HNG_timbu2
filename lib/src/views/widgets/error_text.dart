import 'package:flutter/material.dart';
import 'package:timbu/src/utils/app_colors.dart';

import '../../models/custom_api_error.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.error});
  final Object error;

  String get message {
    if (error is CustomApiError) {
      return (error as CustomApiError).message;
    }
    if (error is String) return error as String;
    return error.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline_rounded,
          size: 80.0,
          color: kTabColor,
        ),
        const SizedBox(height: 10.0),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
            color: kTabColor,
          ),
        ),
      ],
    );
  }
}
