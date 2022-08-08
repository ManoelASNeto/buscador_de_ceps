import 'package:buscador_de_ceps/presentation/bloc/search_cep_bloc.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingState extends StatelessWidget {
  final SearchCepBloc bloc;
  final TextEditingController controller;
  const LoadingState({
    Key? key,
    required this.bloc,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration.collapsed(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    hintText: 'Digite o seu CEP',
                    hintStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  maxLength: 8,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  bloc.add(CepEvent(controller.text));
                  controller.clear();
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    backgroundColor: Colors.blue,
                    shadowColor: Colors.yellow),
                child: const Padding(
                  padding: EdgeInsets.only(right: 35, left: 35),
                  child: Text(
                    'Pesquisar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
