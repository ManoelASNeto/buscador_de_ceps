import 'package:buscador_de_ceps/core/navigations/router.dart';
import 'package:buscador_de_ceps/core/navigations/routes.dart';
import 'package:buscador_de_ceps/injection_container.dart' as di;
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding();
  await di.init();

  EquatableConfig.stringify = true;

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      onGenerateRoute: _router.generateRoutes,
      initialRoute: Routes.homePage,
      navigatorObservers: [HeroController()],
    );
  }
}
