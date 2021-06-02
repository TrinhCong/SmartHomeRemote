import 'dart:math';

import 'package:flutter/material.dart';

class IconBulb extends StatelessWidget {
  final double size;
  final Color? color;
  final FontWeight? fontWeight;
  IconBulb({this.size = 20, this.color, this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(size, size),
        painter: _IconBulbPainter(color: color, fontWeight: fontWeight),
      ),
    );
  }
}

class _IconBulbPainter extends CustomPainter {
  Color? color;
  FontWeight? fontWeight;
  _IconBulbPainter({this.color, this.fontWeight});
  @override
  void paint(Canvas canvas, Size size) {
    var _width = size.width;
    var _height = size.height;
    var bulbRadius = (_width * .8) / 2;
    var angle1 = 0.7 * pi;
    var angle2 = 1.6 * pi;
    var _color = color ?? Colors.black;
    double _weight = fontWeight == FontWeight.bold ? _width * .1 : _width * .07;
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(_width / 2, bulbRadius),
            width: bulbRadius * 2,
            height: bulbRadius * 2),
        angle1,
        angle2,
        false,
        Paint()
          ..color = _color
          ..strokeWidth = _weight
          ..style = PaintingStyle.stroke);

    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(_width / 2, bulbRadius),
            width: bulbRadius * 1.4,
            height: bulbRadius * 1.4),
        pi,
        0.4 * pi,
        false,
        Paint()
          ..color = _color
          ..strokeWidth = _weight
          ..style = PaintingStyle.stroke);

    var ah = sin(0.3 * pi) * bulbRadius;
    var ch = cos(0.3 * pi) * bulbRadius;
    canvas.drawLine(
        Offset(_width / 2 + ch, ah + bulbRadius),
        Offset(_width / 2 - ch, ah + bulbRadius),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = _weight
          ..color = _color);

    canvas.drawRect(
        Rect.fromPoints(Offset(_width / 2 - ch * .8, ah + bulbRadius),
            Offset(_width / 2 + ch * .8, _height * .94)),
        Paint()
          ..color = _color
          ..strokeWidth = _weight
          ..style = PaintingStyle.stroke);
    canvas.drawLine(
        Offset(_width / 2 - ch * .7, _height * 0.97),
        Offset(_width / 2 + ch * .7, _height * 0.97),
        Paint()
          ..color = _color
          ..strokeWidth = _weight * 2
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
