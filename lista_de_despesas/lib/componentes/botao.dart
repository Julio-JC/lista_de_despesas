import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final Function() aoPressionar;

  const Botao({Key? key, required this.texto, required this.aoPressionar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: aoPressionar, child: Text(texto));
  }
}
