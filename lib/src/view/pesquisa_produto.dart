import 'package:flutter/material.dart';

import '../bean/produto_bean.dart';
import '../lista_simulada/lista_simulada.dart';

class PesquisaProduto extends StatefulWidget {
  const PesquisaProduto({super.key});

  @override
  State<StatefulWidget> createState() {
    return PesquisaProdutoState();
  }
}

class PesquisaProdutoState extends State<PesquisaProduto> {
  List<ProdutoBean> lista = ListaSimulada().lista();
  List<ProdutoBean> listaPedido = [];
  var textPesquisa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(children: <Widget>[
          SearchBar(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.green),
            controller: textPesquisa,
            leading: IconButton(
                onPressed: () {
                  setState(() {
                    lista.clear();
                    lista.addAll(pesquisaProduto(textPesquisa.text));
                  });
                },
                icon: const Icon(Icons.search_rounded)),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            shrinkWrap: true,
            itemCount: lista.length,
            itemBuilder: ((context, index) => Card(
                  color: Colors.amber[700],
                  child: ListTile(
                      trailing: IconButton(
                        icon: const Icon(Icons.add_circle),
                        onPressed: () => listaPedido.add(lista[index]),
                      ),
                      title: Text(lista[index].descricao),
                      subtitle: Text(lista[index].codigo)),
                )),
          ),
        ]));
  }

  List<ProdutoBean> pesquisaProduto(String pesquisa) {
    List<ProdutoBean> lista = ListaSimulada().lista();
    List<ProdutoBean> listaTemp = [];
    lista.forEach((element) {
      if (element.descricao.contains(pesquisa)) {
        listaTemp.add(element);
      }
    });
    return listaTemp;
  }
}
