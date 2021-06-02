import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_house_remote/components/icons/icon_bulb.dart';

class IconBulbPlus extends StatelessWidget {
  final double size;
  final Color? color;
  final FontWeight? fontWeight;
  IconBulbPlus({this.size = 20, this.color, this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          IconBulb(
            size: size,
            color: color,
            fontWeight: fontWeight,
          ),
          CustomPaint(
            size: Size(size, size),
            painter: _IconBulbPlusPainter(color: color, fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}

class _IconBulbPlusPainter extends CustomPainter {
  Color? color;
  FontWeight? fontWeight;
  _IconBulbPlusPainter({this.color, this.fontWeight});
  @override
  void paint(Canvas canvas, Size size) {
    var _width = size.width;
    var _height = size.height;
    var bulbRadius = (_width * .8) / 2;
    var centerX = _width / 2 + bulbRadius * .9;
    var centerY = bulbRadius;
    var center = Offset(centerX, centerY);
    var _color = color ?? Colors.black;
    var plusCircleRadius = bulbRadius / 1.7;
    double _weight = fontWeight == FontWeight.bold ? _width * .1 : _width * .07;
    canvas.drawCircle(
        center,
        plusCircleRadius,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill);
    canvas.drawLine(
        Offset(centerX - plusCircleRadius * .7, centerY),
        Offset(centerX + plusCircleRadius * .7, centerY),
        Paint()
          ..color = _color
          ..strokeWidth = _weight
          ..style = PaintingStyle.stroke);
    canvas.drawLine(
        Offset(centerX, centerY - plusCircleRadius * .7),
        Offset(centerX, centerY + plusCircleRadius * .7),
        Paint()
          ..color = _color
          ..strokeWidth = _weight
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
