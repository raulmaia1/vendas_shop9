

import 'package:vendas/src/bean/produto_bean.dart';

class ProdutoBuilder {
  late final ProdutoBean produtoBean;

  ProdutoBuilder(){
    produtoBean = ProdutoBean();
  }

  ProdutoBuilder comDescricao(String descricao){
    produtoBean.descricao = descricao;
    return this;
  }

  ProdutoBuilder comCodigo(String codigo){
    produtoBean.codigo = codigo;
    return this;
  }

}