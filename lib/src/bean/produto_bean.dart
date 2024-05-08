import 'dart:ffi';

class ProdutoBean {
  String descricao = '', codigo = '';

  static ProdutoBean converterJson(Map<String, dynamic> json){
    ProdutoBean p = ProdutoBean();

      p.descricao = json['descricaoProduto'];
      p.codigo = json['codigo'];

    return p;
  }
}
