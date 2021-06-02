import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_house_remote/screens/home.dart';
import 'package:smart_house_remote/configurations/routes.dart';
import 'package:smart_house_remote/state/app.dart';
import 'package:smart_house_remote/configurations/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: Store<AppState>(AppState.reducer,
          initialState: AppState(routes: [AppRoutes.initRoute])),
      child: StoreConnector<AppState, ThemeMode?>(
        converter: (Store<AppState> store) {
          return store.state.themeMode;
        },
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Smart Home Remote',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            onGenerateRoute: AppRoutes.getRoutes,
          );
        },
      ),
    );
  }
}
