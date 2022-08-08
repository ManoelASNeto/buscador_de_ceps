import 'package:buscador_de_ceps/presentation/bloc/search_cep_bloc.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_event.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadyState extends StatelessWidget {
  final SearchCepBloc bloc;
  final TextEditingController controller;
  final SearchCepState searchCepState;

  const ReadyState({
    Key? key,
    required this.bloc,
    required this.controller,
    required this.searchCepState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cep = searchCepState.entity;
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(
              'assets/image.png',
            ),
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 180,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Buscador de ',
                      style: GoogleFonts.caveat(
                        textStyle:
                            const TextStyle(fontSize: 35, color: Colors.black),
                      ),
                    ),
                    const TextSpan(
                      text: "CEP's",
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
                      hintText: 'Digite o seu CEP',
                      hintStyle: TextStyle(fontSize: 25),
                    ),
                    maxLength: 8,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  bloc.add(
                    CepEvent(controller.text),
                  );
                  controller.clear();
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                    shadowColor: Colors.yellow),
                child: const Padding(
                  padding: EdgeInsets.only(right: 35, left: 35),
                  child: Text('Pesquisar'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Card(
                margin: const EdgeInsets.all(20),
                elevation: 10,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Logradouro: ${cep?.publicPlace ?? 'Não Encontrado'}',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 20, 100, 238)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Bairro: ${cep?.district ?? ''}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cidade: ${cep?.location ?? ''}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(cep?.stateAbreviation ?? ''),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
