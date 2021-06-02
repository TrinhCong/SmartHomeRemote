import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Switcher extends StatefulWidget {
  String text;
  String inactivatedText;
  bool value;
  ValueChanged<bool>? onChanged;
  double width;
  double height;
  Switcher({
    this.text = "On",
    this.inactivatedText = "Off",
    this.value = false,
    this.width = 50,
    this.height = 20,
    this.onChanged,
  });
  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late bool _value;
  late bool _changing;
  @override
  void initState() {
    super.initState();
    _changing = false;
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed)
          _changing = false;
        else
          _changing = true;
      });
    _value = widget.value;
    if (_value) _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildText(String text, double offset) {
      return Flexible(
          child: Container(
        padding: EdgeInsets.only(left: offset),
        alignment: Alignment.center,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        ),
      ));
    }

    Widget _buildSpacer(double width) {
      return SizedBox(
        width: width,
        height: widget.height,
      );
    }

    return InkWell(
      onTap: () {
        if (!_changing) {
          _value = !_value;
          if (_value)
            _controller.forward();
          else
            _controller.reverse();
          if (widget.onChanged != null) widget.onChanged!(_value);
        }
      },
      child: Container(
        width: widget.width,
        child: Stack(
          children: [
            Container(
                width: widget.width,
                child: CustomPaint(
                  size: Size(widget.width, widget.height),
                  painter: _SwitchPainer(position: _animation.value),
                )),
            _value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildText(widget.text, 4),
                      _buildSpacer(widget.height)
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildSpacer(widget.height - 4),
                      _buildText(widget.inactivatedText, 0),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class _SwitchPainer extends CustomPainter {
  double position;
  _SwitchPainer({this.position = 0});
  @override
  void paint(Canvas canvas, Size size) {
    var _width = size.width;
    var _height = size.height;
    var _switcherRadius = _height / 2;
    if (position < 0)
      position = 0;
    else if (position > 1) position = 1;

    var outlinePath = Path()
      ..moveTo(_switcherRadius, 0)
      ..arcToPoint(Offset(_switcherRadius, _height),
          radius: Radius.circular(_height / 2), clockwise: false)
      ..lineTo(_width * .8, _height)
      ..arcToPoint(Offset(_width * .8, 0),
          radius: Radius.circular(_height / 2), clockwise: false)
      ..lineTo(_switcherRadius, 0);
    canvas.drawPath(
        outlinePath, Paint()..color = Colors.grey.withOpacity(1 - position));
    canvas.drawPath(
        outlinePath, Paint()..color = Colors.green.withOpacity(position));

    var distance = position * (_width - _switcherRadius * 2);
    var offset = Offset(_switcherRadius + distance, _switcherRadius);
    canvas.drawCircle(offset, _switcherRadius * 1.1,
        Paint()..color = Colors.grey.withOpacity(1 - position));
    canvas.drawCircle(offset, _switcherRadius * 1.1,
        Paint()..color = Colors.green.withOpacity(position));
    canvas.drawCircle(offset, _switcherRadius, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
