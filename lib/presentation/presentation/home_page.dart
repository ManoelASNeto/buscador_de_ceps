import 'package:buscador_de_ceps/injection_container.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_bloc.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  var _searchBloc = sl<SearchCepBloc>();

  @override
  void initState() {
    _searchBloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.network(
            'https://store-images.s-microsoft.com/image/apps.6607.13510798887520085.3b5999bd-0689-4a5d-b1fa-378e87bb83a5.ee076621-7430-46f1-a4ac-a0c442d69e58?mode=scale&q=90&h=200&w=200&background=%230078D7',
          ),
          BlocBuilder<SearchCepBloc, SearchCepState>(
            builder: (context, state) {
              return _search(state, context);
            },
          ),
        ],
      ),
    );
  }

  Widget _search(SearchCepState state, BuildContext context) {
    switch (state.status) {
      case SearchCepStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case SearchCepStatus.ready:
        return _ready(state, context);
      default:
        return const Center(
          child: Text('Carregando'),
        );
    }
  }

  Widget _ready(SearchCepState state, BuildContext context) {
    return Center(
      child: Container(
        child: Card(elevation: 10),
      ),
    );
  }
}
