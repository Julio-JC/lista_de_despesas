import 'package:flutter/material.dart';
import 'package:lista_de_despesas/models/item_da_compra.dart';
import '../card_de_compra.dart';

class ListaCompra extends StatelessWidget {
  final List<ItemDaCompra> itens;

  const ListaCompra({Key? key, required this.itens}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.blue,
            child: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index) {
                final tr = itens[index];
                return CardDeCompra(
                  titulo: tr.nomeDoItem,
                  valor: tr.valor,
                  pego: false,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
