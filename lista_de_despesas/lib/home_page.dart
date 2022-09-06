import 'package:flutter/material.dart';
import 'package:lista_de_despesas/componentes/formulario.dart';
import '../models/item_da_compra.dart';
import '../componentes/lista_compra.dart';
import '../componentes/formulario.dart';
import 'dart:math';

import 'card_de_compra.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ItemDaCompra> item;

  var valorItens = ItemDaCompra(
      id: 'id', nomeDoItem: '', quantidade: 0, valor: 0.0, pego: false);
  final List<ItemDaCompra> itens = [
    ItemDaCompra(
      id: 'c1',
      nomeDoItem: 'Arroz',
      quantidade: 1,
      valor: 10.00,
      pego: false,
    ),
    ItemDaCompra(
      id: 'c2',
      nomeDoItem: 'Feijão',
      quantidade: 1,
      valor: 5.00,
      pego: false,
    ),
  ];

  addTransacao(String nome, double valorItem) {
    final novoItem = ItemDaCompra(
        id: Random().nextDouble().toString(),
        nomeDoItem: nome,
        quantidade: 1,
        valor: valorItem,
        pego: false);

    setState(() {
      itens.add(novoItem);
    });

    Navigator.of(context).pop();
  }

  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Formulario(onSubmit: addTransacao);
        });
  }

  @override
  Widget build(BuildContext context) {
    double valoTotal = 0.0;

    for (var x in itens) {
      valoTotal += x.valor;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Despesas'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Valor Toral: ',
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 40,
                    width: 150,
                    color: Colors.blueGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('R\$ ${valoTotal.toStringAsFixed(2)}'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () => openTransactionFormModal(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
