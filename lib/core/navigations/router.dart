import 'package:buscador_de_ceps/core/navigations/routes.dart';
import 'package:buscador_de_ceps/injection_container.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_bloc.dart';

import 'package:buscador_de_ceps/presentation/presentation/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final _searchBloc = sl<SearchCepBloc>();

  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _searchBloc,
            child: const HomePage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
    }
  }
}
