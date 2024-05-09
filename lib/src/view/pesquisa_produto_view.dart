import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vendas/src/dao/produto_dao.dart';

import '../bean/produto_bean.dart';
import '../controller/pesquisa_produto_controller.dart';

class PesquisaProduto extends StatefulWidget {
  const PesquisaProduto({super.key});

  @override
  State<StatefulWidget> createState() {
    return PesquisaProdutoState();
  }
}

class PesquisaProdutoState extends State<PesquisaProduto> {
  List<ProdutoBean> lista = [];


  var textPesquisa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textPesquisa.text = "Proteinado";
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
      SearchBar(
        backgroundColor:
        MaterialStateProperty.resolveWith((states) => Colors.green),
        controller: textPesquisa,
        leading: IconButton(
            onPressed: () {
              pesquisaProduto(textPesquisa.text).then((value)  {
                lista.clear();
                lista.addAll(value);
              }).whenComplete(() => setState(() {}));
            },
            icon: const Icon(Icons.search_rounded)),
      ),
      ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        shrinkWrap: true,
        itemCount: lista.length,
        itemBuilder: ((context, index) => Card(
          color: Colors.amber[700],
          child: ListTile(
              trailing: IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: () => PesquisaProdutoController.venda.listaPedido.add(lista[index]),
              ),
              title: Text(lista[index].descricao),
              subtitle: Text(lista[index].codigo)),
        )),
      ),
    ]));
  }

  Future<List<ProdutoBean>> pesquisaProduto(String pesquisa) async {
    return await compute(ProdutoDao().procuraProdutoViaSQLServer, pesquisa);
  }
}
