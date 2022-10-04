import 'package:flutter/material.dart';
import 'package:lista_de_despesas/componentes/botao.dart';
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
  final ItemDaCompra itemDaCompra = ItemDaCompra(
    id: '',
    nomeDoItem: '',
    valor: 0.00,
    quantidade: 0,
    estaNoCarrinho: false,
  );

  double valorTotal = 0.00;

  addTransacao(String nome, double valorItem) {
    final novoItem = ItemDaCompra(
        id: Random().nextDouble().toString(),
        nomeDoItem: nome,
        valor: valorItem,
        quantidade: 1,
        estaNoCarrinho: false);

    setState(() {
      itens.add(novoItem);
      valorTotal += valorItem;
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
  }

  void removerItemDoCard(ItemDaCompra item) {
    setState(() {
      item.quantidade--;
    });
  }

  double adicionarValorTotal(ItemDaCompra item) {
    setState(() {
      valorTotal += item.valor;
    });

    return valorTotal;
  }

  double subtrairValorTotal(ItemDaCompra item) {
    setState(() {
      valorTotal -= item.valor;
    });
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: itens.length <= 1
                    ? Text('Tem ${itens.length} item no carrinho')
                    : Text('Tem ${itens.length} itens no carrinho'),
              ),
              const SizedBox(
                width: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Valor Toral: ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
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
                      final ItemDaCompra tr = itens[index];
                      return CardDeCompra(
                        itemDaCompra: tr,
                        onDelete: onDelete,
                        isSelected: tr.quantidade <= 1 ? false : true,
                        adicionarItem: () {
                          adicionarItemDoCard(tr);
                          adicionarValorTotal(tr);
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Botao(
                      texto: 'Limpar Tudo',
                      aoPressionar: () {
                        setState(() {
                          itens.clear();
                          valorTotal = 0.00;
                        });
                      })),
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

  void onDelete(ItemDaCompra itemDaCompra) {
    setState(() {
      itens.remove(itemDaCompra);
      valorTotal = valorTotal - itemDaCompra.valor * itemDaCompra.quantidade;
    });
  }
}
