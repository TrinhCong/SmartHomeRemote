import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_house_remote/state/app.dart';

class TextSmall extends StatelessWidget {
  final String data;
  Color? color;
  TextSmall(this.data, {Key? key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ThemeMode>(converter: (store) {
      return store.state.themeMode;
    }, builder: (context, themeMode) {
      var _color = color ??
          (themeMode == ThemeMode.light
              ? Colors.black.withOpacity(0.7)
              : Colors.white.withOpacity(0.7));
      return Text(
        data,
        style: TextStyle(color: _color, fontSize: 12),
      );
    });
  }
}
