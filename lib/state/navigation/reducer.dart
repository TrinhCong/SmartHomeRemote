import 'package:smart_house_remote/state/navigation/actions.dart';

List<String> navigationReducer(List<String> routes, action) {
  if (action is RouteChanged)
    return action.routes;
  else
    return routes;
}
