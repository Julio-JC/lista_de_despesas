import 'dart:math';
import 'package:flutter/material.dart';
import '../models/item_da_compra.dart';
import 'lista_compra.dart';
import 'formulario.dart';

class TransacaoDoUsuario extends StatefulWidget {
  const TransacaoDoUsuario({Key? key}) : super(key: key);

  @override
  State<TransacaoDoUsuario> createState() => _TransacaoDoUsuarioState();
}

class _TransacaoDoUsuarioState extends State<TransacaoDoUsuario> {
  final itens = [
    ItemDaCompra(
      id: 'c1',
      nomeDoItem: 'Arroz',
      quantidade: 3,
      valor: 15.30,
    ),
    ItemDaCompra(
      id: 'c2',
      nomeDoItem: 'Feijão',
      quantidade: 3,
      valor: 14.50,
    ),
  ];

  addTransacao(String nome, double valorItem) {
    final novoItem = ItemDaCompra(
      id: Random().nextDouble().toString(),
      nomeDoItem: nome,
      quantidade: 1,
      valor: valorItem,
    );

    setState(() {
      itens.add(novoItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListaCompra(itens: itens),
          Formulario(addTransacao),
        ],
      ),
    );
  }
}
