import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_cep_bloc.dart';
import '../bloc/search_cep_state.dart';
import 'states/loading_state.dart';
import 'states/ready_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  late SearchCepBloc _searchCepBloc;

  @override
  void initState() {
    _searchCepBloc = BlocProvider.of<SearchCepBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<SearchCepBloc, SearchCepState>(
        builder: (context, state) {
          return _search(state, context);
        },
      ),
    );
  }

  Widget _search(SearchCepState state, BuildContext context) {
    switch (state.status) {
      case SearchCepStatus.loading:
        return LoadingState(
          bloc: _searchCepBloc,
          controller: controller,
        );
      case SearchCepStatus.ready:
        return ReadyState(
          bloc: _searchCepBloc,
          controller: controller,
          searchCepState: state,
        );
      default:
        return const Center(
          child: Text('Carregando'),
        );
    }
  }
}
