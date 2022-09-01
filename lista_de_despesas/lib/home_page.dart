import 'package:flutter/material.dart';
import 'package:lista_de_despesas/componentes/botao.dart';
import 'package:lista_de_despesas/componentes/formulario.dart';
import '../models/item_da_compra.dart';
import '../componentes/lista_compra.dart';
import '../componentes/formulario.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ItemDaCompra> itens = [
    ItemDaCompra(
      id: 'c1',
      nomeDoItem: 'Arroz',
      quantidade: 1,
      valor: 10.00,
    ),
    ItemDaCompra(
      id: 'c2',
      nomeDoItem: 'Feijão',
      quantidade: 1,
      valor: 5.00,
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
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('R\$ '),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListaCompra(itens: itens),
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
