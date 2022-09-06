class ItemDaCompra {
  final String id;
  late String nomeDoItem;
  late int quantidade;
  late double valor;
  late bool pego = false;
  final Function(double)? noCarrinho;

  ItemDaCompra({
    required this.id,
    required this.nomeDoItem,
    required this.quantidade,
    required this.valor,
    required this.pego,
    this.noCarrinho,
  });
}
