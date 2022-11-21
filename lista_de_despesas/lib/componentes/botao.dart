import 'package:flutter/material.dart';

import '../models/constantes.dart';

class Botao extends StatelessWidget {
  const Botao({Key? key, required this.texto, required this.aoPressionar})
      : super(key: key);

  final String texto;
  final Function() aoPressionar;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: aoPressionar,
      style: ElevatedButton.styleFrom(backgroundColor: Constants.kCorDosBotoes),
      child: Text(texto),
    );
  }
}
