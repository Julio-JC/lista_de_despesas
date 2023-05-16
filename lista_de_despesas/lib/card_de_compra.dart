import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lista_de_despesas/models/item_da_compra.dart';
import 'models/constantes.dart';

class CardDeCompra extends StatelessWidget {
  const CardDeCompra({
    Key? key,
    required this.itemDaCompra,
    required this.isSelected,
    required this.onDelete,
    required this.adicionarItem,
    required this.removerItem,
  }) : super(key: key);

  final ItemDaCompra itemDaCompra;

  final bool isSelected;
  final Function(ItemDaCompra) onDelete;
  final Function() adicionarItem;
  final Function() removerItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Slidable(
        endActionPane: ActionPane(motion: const BehindMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(10),
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: Colors.red,
            onPressed: (context) {
              onDelete(itemDaCompra);
            },
          )
        ]),
        child: Container(
          height: 100,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Constants.kCorDoCard,
          ),
          child: Column(children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: Constants.leadingTrailingCardSpaces),
                    child: Icon(Icons.local_grocery_store_outlined),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        itemDaCompra.nomeDoItem,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
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
                      'R\$: ${itemDaCompra.valor.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: IconButton(
                      onPressed: !isSelected ? null : removerItem,
                      icon: const Icon(
                        Icons.minimize,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Text(
                        'Qtdd:  ${itemDaCompra.quantidade}',
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: adicionarItem,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
