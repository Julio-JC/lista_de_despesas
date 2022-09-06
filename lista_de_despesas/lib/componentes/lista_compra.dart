import 'package:flutter/material.dart';
import 'package:lista_de_despesas/models/item_da_compra.dart';
import '../card_de_compra.dart';

class ListaCompra extends StatelessWidget {
  final List<ItemDaCompra> itens;

  const ListaCompra({Key? key, required this.itens}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double soma = 0.0;
    for (var x in itens) {
      soma += x.valor;
    }
    print(soma);

    return Container();
  }
}
