import 'package:flutter/material.dart';
import 'models/constantes.dart';

// ignore: must_be_immutable
class CardDeCompra extends StatefulWidget {
  String titulo;
  double valor;
  int quantidade = 1;
  bool pego = false;

  CardDeCompra({
    Key? key,
    required this.titulo,
    required this.valor,
    required this.pego,
  }) : super(key: key);

  @override
  State<CardDeCompra> createState() => _CardDeCompraState();
}

class _CardDeCompraState extends State<CardDeCompra> {
  void adicionarItem() {
    setState(() {
      widget.quantidade++;
    });
  }

  void removeItem() {
    setState(() {
      widget.quantidade--;
    });
  }

  late double novoValor = widget.valor;

  void somarValorDoItem() {
    setState(() {
      widget.valor += novoValor;
    });
  }

  void subitrairValorDoItem() {
    setState(() {
      widget.valor -= novoValor;
    });
  }

  double valorT = 0.0;
  valorTotal() {
    setState(() {
      valorT = widget.valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kCorDoCard,
      ),
      child: Column(children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Text(
                    widget.titulo,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Icon(Icons.local_grocery_store_outlined),
              Container(
                margin: const EdgeInsets.only(
                  right: 30,
                ),
                child: Checkbox(
                  value: widget.pego,
                  activeColor: Colors.blue,
                  onChanged: (pego) {
                    setState(() {
                      widget.pego = pego!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 400,
          child: Divider(
            color: Colors.white38,
          ),
        ),
        Expanded(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'R\$: ${widget.valor.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Qtdd:  ${widget.quantidade}',
                    ),
                  ),
                ),
                TextButton.icon(
                    onPressed: () {
                      adicionarItem();
                      somarValorDoItem();
                      valorTotal();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    label: const Text('')),
                TextButton.icon(
                    onPressed: widget.quantidade < 2
                        ? null
                        : () {
                            removeItem();
                            subitrairValorDoItem();
                          },
                    icon: const Icon(
                      Icons.minimize,
                      color: Colors.black,
                    ),
                    label: const Text('')),
              ]),
        ),
      ]),
    );
  }
}
