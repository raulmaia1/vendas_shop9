import 'package:vendas/src/builder/produto_builder.dart';

class ListaSimulada {
  lista() {
    return [
      ProdutoBuilder().comCodigo("1").comDescricao("Produto 1").produtoBean
    ];
  }
}
