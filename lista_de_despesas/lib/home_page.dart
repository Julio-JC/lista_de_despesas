import 'package:flutter/material.dart';
import '../models/item_da_compra.dart';
import '../componentes/formulario.dart';
import 'dart:math';
import 'card_de_compra.dart';
import 'models/constantes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ItemDaCompra> itens = [];

  addTransacao(String nome, double valorItem) {
    final novoItem = ItemDaCompra(
        id: Random().nextDouble().toString(),
        nomeDoItem: nome,
        valor: valorItem,
        quantidade: 1,
        estaNoCarrinho: false);

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

  void adicionarItemDoCard(ItemDaCompra item) {
    setState(() {
      item.quantidade++;
    });

    print('${item.quantidade}');
  }

  void removerItemDoCard(ItemDaCompra item) {
    setState(() {
      item.quantidade--;
    });
    print('${item.quantidade}');
  }

  double calcularTotalDoCard(ItemDaCompra item) {
    double total = 0;
    setState(() {
      for (var x in itens) {
        if (x.nomeDoItem == item.nomeDoItem) {
          total = item.valor++;
        }
      }
    });
    return total;
  }

  double valorTotal = 0.00;
  double adicionarValorTotal(ItemDaCompra item) {
    setState(() {
      valorTotal += item.valor;
    });
    print(valorTotal);
    return valorTotal;
  }

  double subtrairValorTotal(ItemDaCompra item) {
    setState(() {
      valorTotal -= item.valor;
    });
    print(valorTotal);
    return valorTotal;
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
                    color: kCorDoContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('R\$ ${valorTotal.toStringAsFixed(2)}'),
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
                  color: kCorDoContainer,
                  child: ListView.builder(
                    itemCount: itens.length,
                    itemBuilder: (context, index) {
                      final tr = itens[index];
                      return CardDeCompra(
                        titulo: tr.nomeDoItem,
                        valor: tr.valor,
                        quantidade: tr.quantidade,
                        estaNoCarrinho: tr.estaNoCarrinho,
                        isSelected: tr.quantidade <= 1 ? false : true,
                        adicionarItem: () {
                          adicionarItemDoCard(tr);
                          adicionarValorTotal(tr);
                          print('Acicionar item');
                        },
                        removerItem: () {
                          removerItemDoCard(tr);
                          subtrairValorTotal(tr);
                        },
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
                  backgroundColor: Colors.deepOrange,
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
