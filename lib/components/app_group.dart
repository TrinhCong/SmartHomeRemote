import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:redux/redux.dart';
import 'package:smart_house_remote/components/switcher.dart';
import 'package:smart_house_remote/components/text.dart';
import 'package:smart_house_remote/state/app.dart';

// ignore: must_be_immutable
class AppGroup extends StatelessWidget {
  IconData iconData;
  Color iconColor;
  String title;
  String description;
  bool on;

  AppGroup(
      {Key? key,
      this.iconData = Icons.ac_unit,
      this.iconColor = Colors.blue,
      this.title = "title",
      this.description = "description",
      this.on = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ThemeMode>(
      converter: (Store<AppState> store) {
        return store.state.themeMode;
      },
      builder: (context, themeMode) => Container(
        margin: EdgeInsets.only(bottom: 12, right: 3),
        decoration: BoxDecoration(
            color: themeMode == ThemeMode.light ? Colors.white : Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(2, 2))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: iconColor.withOpacity(0.1),
                  radius: 20,
                  child: Icon(
                    iconData,
                    size: 22,
                    color: iconColor,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextSmall(description),
                    ],
                  ),
                ),
              ),
              Switcher(
                value: on,
                width: 60,
                height: 24,
              ),
              Icon(
                MdiIcons.chevronRight,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
