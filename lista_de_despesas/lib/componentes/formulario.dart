import 'package:flutter/material.dart';
import 'botao.dart';

class Formulario extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const Formulario({required this.onSubmit, Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final itemController = TextEditingController();
  final valorController = TextEditingController();

  submeterFormulario() {
    final nomeItem = itemController.text;
    final valorItem = double.tryParse(valorController.text) ?? 0;

    if (nomeItem.isEmpty || valorItem <= 0) {
      return;
    }

    widget.onSubmit(nomeItem, valorItem);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: itemController,
              onSubmitted: (_) => submeterFormulario(),
              decoration: const InputDecoration(labelText: 'Item: '),
            ),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submeterFormulario(),
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Botao(
                    texto: 'Cancelar',
                    aoPressionar: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Botao(
                    texto: 'Adicionar',
                    aoPressionar: submeterFormulario,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
