class ItemDaCompra {
  final String id;
  late String nomeDoItem;
  late double valor;
  late int quantidade;
  late bool estaNoCarrinho = false;

  ItemDaCompra({
    required this.id,
    required this.nomeDoItem,
    required this.valor,
    required this.quantidade,
    required this.estaNoCarrinho,
  });
}
