import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smart_house_remote/components/icons/icon_bulb.dart';
import 'package:smart_house_remote/components/icons/icon_bulb_plus.dart';
import 'package:smart_house_remote/components/switcher.dart';
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
                        ? [Colors.black.withOpacity(0.5), Colors.black]
                        : [Colors.white, Colors.grey],
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconBulbPlus(
                            size: 25,
                          ),
                          Text("Add Smart Bulb")
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
