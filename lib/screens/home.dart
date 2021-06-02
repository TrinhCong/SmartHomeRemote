import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:redux/redux.dart';
import 'package:smart_house_remote/components/app_group.dart';
import 'package:smart_house_remote/components/icons/icon_bulb.dart';
import 'package:smart_house_remote/components/icons/icon_bulb_plus.dart';
import 'package:smart_house_remote/components/switcher.dart';
import 'package:smart_house_remote/components/text.dart';
import 'package:smart_house_remote/configurations/theme.dart';
import 'package:smart_house_remote/state/app.dart';
import 'package:smart_house_remote/state/theme/actions.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, bool>(
        converter: (store) => store.state.themeMode == ThemeMode.dark,
        builder: (context, isDark) => Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isDark
                        ? [Colors.black12, Colors.black]
                        : [Colors.white, Colors.grey.withOpacity(0.8)],
                    stops: [0, 1])),
            child: Column(
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Switcher(
                          text: "Dark",
                          inactivatedText: "Light",
                          width: 60,
                          height: 24,
                          value: isDark,
                          onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(
                                ThemeChanged(
                                    value ? ThemeMode.dark : ThemeMode.light));
                          }),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "My Home",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(MdiIcons.chevronDown)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 26,
                            child: Icon(
                              MdiIcons.lightbulbOnOutline,
                              size: 30,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                          Positioned(
                              bottom: -24, child: TextSmall("Add Smart Bulb"))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 26,
                            child: Icon(
                              MdiIcons.plus,
                              size: 30,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                          Positioned(bottom: -24, child: TextSmall("Add"))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 16),
                          child: Text(
                            "Your Groups",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                AppGroup(
                                  iconData: MdiIcons.doorOpen,
                                  iconColor: Colors.orange,
                                  title: "Entryway",
                                  description: "1 light on",
                                  on: true,
                                ),
                                AppGroup(
                                  iconData: MdiIcons.sofaOutline,
                                  iconColor: Colors.purple,
                                  title: "Living room",
                                  description: "All lights off",
                                  on: true,
                                ),
                                AppGroup(
                                  iconData: MdiIcons.homePlusOutline,
                                  iconColor: Colors.blueAccent,
                                  title: "Kitchen",
                                  description: "2 lights on",
                                  on: true,
                                ),
                                AppGroup(
                                  iconData: MdiIcons.roomService,
                                  iconColor: Colors.blueAccent,
                                  title: "Bathroom",
                                  description: "All lights off",
                                  on: true,
                                ),
                                AppGroup(
                                  iconData: MdiIcons.railroadLight,
                                  iconColor: Colors.blueAccent,
                                  title: "Bacony",
                                  description: "2 lights on",
                                  on: true,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                StoreConnector<AppState, ThemeMode>(
                    converter: (Store<AppState> store) {
                      return store.state.themeMode;
                    },
                    builder: (context, themeMode) => Container(
                          color: themeMode == ThemeMode.light
                              ? Colors.white
                              : Colors.black54,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Icon(
                                    MdiIcons.home,
                                    color: Colors.pink[600],
                                  ),
                                  TextSmall(
                                    "Home",
                                    color: Colors.pink[600],
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Icon(MdiIcons.image),
                                  TextSmall("Scenes"),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Icon(MdiIcons.calendar),
                                  TextSmall("Schedule"),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Icon(MdiIcons.switchIcon),
                                  TextSmall("Manage"),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Icon(MdiIcons.account),
                                  TextSmall("Me"),
                                ],
                              )),
                            ],
                          ),
                        ))
              ],
            )),
      ),
    );
  }
}
