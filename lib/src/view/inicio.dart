import 'package:flutter/material.dart';
import 'package:vendas/src/view/pedido.dart';
import 'package:vendas/src/view/pesquisa_produto_view.dart';

import '../bean/produto_bean.dart';

class Inicio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InicioState();
  }
}

class InicioState extends State<Inicio> {
  int _index = 0;

  final _janelas = [
    const PesquisaProduto(),
    Pedido(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pesquisa Shop',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromRGBO(1, 34, 95, 0.922)),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: _janelas[_index],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) => setState(() => _index = value),
              currentIndex: _index,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.wysiwyg_sharp), label: 'Produtos'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.align_vertical_bottom_sharp),
                    label: 'Pedidos'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections_bookmark_outlined),
                    label: 'Finalizar')
              ]),
        ));
  }
}
