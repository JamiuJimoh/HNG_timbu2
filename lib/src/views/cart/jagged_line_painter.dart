import 'package:flutter/material.dart';
import 'package:timbu/src/utils/app_colors.dart';

class JaggedLinePainter extends CustomPainter {
@override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = kTabColor.withOpacity(0.5)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0;

    double dashWidth = 7.0;
    double dashSpace = 5.0;
    double startX = 0;
    final double endX = size.width;

    while (startX < endX) {
      canvas.drawLine(Offset(startX, size.height / 2),
                      Offset(startX + dashWidth, size.height / 2),
                      paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
