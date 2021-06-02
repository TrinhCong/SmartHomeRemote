class NavigationAction {}

class RouteChanged extends NavigationAction {
  List<String> routes;
  RouteChanged({this.routes = const []});
}
