import 'package:flutter/material.dart';
import 'models/constantes.dart';

// ignore: must_be_immutable
class CardDeCompra extends StatelessWidget {
  String titulo;
  double valor;
  int quantidade;
  bool estaNoCarrinho = false;
  bool isSelected;
  final Function() adicionarItem;
  final Function() removerItem;

  CardDeCompra({
    Key? key,
    required this.titulo,
    required this.valor,
    required this.estaNoCarrinho,
    required this.quantidade,
    required this.isSelected,
    required this.adicionarItem,
    required this.removerItem,
  }) : super(key: key);

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
                    titulo,
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
                  value: estaNoCarrinho,
                  activeColor: Colors.blue,
                  onChanged: (pego) {},
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
                    'R\$: ${valor.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: IconButton(
                    onPressed: adicionarItem,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Qtdd:  $quantidade',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: !isSelected ? null : removerItem,
                  icon: const Icon(
                    Icons.minimize,
                    color: Colors.black,
                  ),
                ),
              ]),
        ),
      ]),
    );
  }
}



// Código inicialmente construido;

// // ignore: must_be_immutable
// class CardDeCompra extends StatefulWidget {
//   String titulo;
//   double valor = 0.0;
//   int quantidade = 1;
//   bool estaNoCarrinho = false;
//   late Function? adicionarItem;
//   late Function? removerItem;

//   CardDeCompra({
//     Key? key,
//     required this.titulo,
//     required this.valor,
//     required this.estaNoCarrinho,
//     required this.quantidade,
//   }) : super(key: key);

//   @override
//   State<CardDeCompra> createState() => _CardDeCompraState();
// }

// class _CardDeCompraState extends State<CardDeCompra> {
//   late ItemDaCompra itemDeCompra;
//   QuantidadeDeItem? quantidadeDeItem;

//   void adicionarItem() {
//     setState(() {
//       widget.quantidade++;
//     });
//   }

//   void removeItem() {
//     setState(() {
//       widget.quantidade--;
//     });
//   }

//   void somarValorDoItem() {
//     setState(() {
//       widget.valor += itemDeCompra.valor;
//     });
//   }

//   void subitrairValorDoItem() {
//     setState(() {
//       widget.valor += itemDeCompra.valor;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       height: 100,
//       width: 500,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: kCorDoCard,
//       ),
//       child: Column(children: [
//         Expanded(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(
//                     left: 30,
//                   ),
//                   child: Text(
//                     widget.titulo,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               const Icon(Icons.local_grocery_store_outlined),
//               Container(
//                 margin: const EdgeInsets.only(
//                   right: 30,
//                 ),
//                 child: Checkbox(
//                   value: widget.estaNoCarrinho,
//                   activeColor: Colors.blue,
//                   onChanged: (pego) {
//                     setState(() {
//                       widget.estaNoCarrinho = pego!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           width: 400,
//           child: Divider(
//             color: Colors.white38,
//           ),
//         ),
//         Expanded(
//           child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(
//                     left: 30,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 2,
//                     ),
//                   ),
//                   padding: const EdgeInsets.all(5),
//                   child: Text(
//                     'R\$: ${widget.valor.toStringAsFixed(2)}',
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 100),
//                   child: Container(
//                     margin: const EdgeInsets.only(right: 10),
//                     child: Text(
//                       'Qtdd:  ${quantidadeDeItem!.qtddItem}',
//                     ),
//                   ),
//                 ),
//                 TextButton.icon(
//                     onPressed: () {
//                       adicionarItem();
//                       somarValorDoItem();
//                     },
//                     icon: const Icon(
//                       Icons.add,
//                       color: Colors.black,
//                     ),
//                     label: const Text('')),
//                 TextButton.icon(
//                     onPressed: widget.quantidade < 2
//                         ? null
//                         : () {
//                             removeItem();
//                             subitrairValorDoItem();
//                           },
//                     icon: const Icon(
//                       Icons.minimize,
//                       color: Colors.black,
//                     ),
//                     label: const Text('')),
//               ]),
//         ),
//       ]),
//     );
//   }
// }
