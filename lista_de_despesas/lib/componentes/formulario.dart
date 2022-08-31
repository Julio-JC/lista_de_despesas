import 'package:flutter/material.dart';
import 'botao.dart';

class Formulario extends StatelessWidget {
  final itemController = TextEditingController();
  final valorController = TextEditingController();

  final void Function(String, double) onSubmit;

  Formulario(this.onSubmit, {Key? key}) : super(key: key);

  submeterFormulario() {
    final nomeItem = itemController.text;
    final valorItem = double.tryParse(valorController.text) ?? 0;

    if (nomeItem.isEmpty || valorItem <= 0) {
      return;
    }

    onSubmit(nomeItem, valorItem);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
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
                      texto: 'Adicionar',
                      aoPressionar: submeterFormulario,
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    Botao(
                      texto: '+',
                      aoPressionar: () {},
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Botao(
                      texto: '-',
                      aoPressionar: () {},
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
