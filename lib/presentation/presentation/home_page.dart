import 'package:buscador_de_ceps/injection_container.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_bloc.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_event.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
        return _loading(state, context);
      case SearchCepStatus.ready:
        return _ready(state, context);
      default:
        return const Center(
          child: Text('Carregando'),
        );
    }
  }

  Widget _loading(SearchCepState state, BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 240, 216, 2),
              Color.fromARGB(255, 13, 71, 119),
              Color.fromARGB(255, 0, 14, 26)
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Buscador de',
                      style: GoogleFonts.caveat(
                        textStyle:
                            const TextStyle(fontSize: 35, color: Colors.black),
                      ),
                    ),
                    const TextSpan(
                      text: ' CEP´s',
                      style: TextStyle(color: Colors.black87, fontSize: 28),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width - 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration.collapsed(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        hintText: 'Digite o seu CEP'),
                    maxLength: 8,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {
                  _searchBloc.add(CepEvent());
                },
                style: OutlinedButton.styleFrom(elevation: 5),
                child: const Text('Pesquisar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ready(SearchCepState state, BuildContext context) {
    return const Center(
      child: Card(elevation: 10),
    );
  }
}
