import 'package:flutter/material.dart';
import 'models/constantes.dart';

// ignore: must_be_immutable
class CardDeCompra extends StatefulWidget {
  String titulo;
  double valor;
  int quantidade;
  bool pego = false;

  CardDeCompra({
    Key? key,
    required this.titulo,
    required this.valor,
    required this.quantidade,
    required this.pego,
  }) : super(key: key);

  @override
  State<CardDeCompra> createState() => _CardDeCompraState();
}

class _CardDeCompraState extends State<CardDeCompra> {
  bool valor = true;
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
              Container(
                margin: const EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  widget.titulo,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 300,
              ),
              const Icon(Icons.local_grocery_store_outlined),
              Container(
                margin: const EdgeInsets.only(
                  right: 30,
                ),
                child: Checkbox(
                  value: widget.pego,
                  activeColor: Colors.blue,
                  onChanged: (valor) {
                    setState(() {
                      widget.pego = valor!;
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            Container(
              margin: const EdgeInsets.only(right: 80),
              child: Text(
                'Qtdd:  ${widget.quantidade}',
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
