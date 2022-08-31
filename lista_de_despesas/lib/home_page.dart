import 'package:flutter/material.dart';
import 'package:lista_de_despesas/componentes/botao.dart';
import 'package:lista_de_despesas/componentes/transacao_do_usuario.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          const TransacaoDoUsuario(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Botao(
                  texto: 'Adicionar item',
                  aoPressionar: () {
                    print('Item adicionado');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: Botao(
                      texto: 'Remover Item',
                      aoPressionar: () {
                        print('Item removido');
                      })),
            ],
          ),
        ],
      ),
    );
  }
}
