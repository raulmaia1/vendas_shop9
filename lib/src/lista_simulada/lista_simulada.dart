
import 'package:vendas/src/builder/produto_builder.dart';

import '../bean/produto_bean.dart';

class ListaSimulada {
  lista() {
    return [ProdutoBuilder().comCodigo("1").comDescricao("Produto 1").produtoBean];
  }
}
