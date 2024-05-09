
class ProdutoBean {
  String descricao = '', codigo = '', nomeTabela ='', codigoBarra = '',codigoAdicionalDois = '',precoUnitario = '', codigoAdicionalUm = '', obs = '';
  int ordem = 0;
  static ProdutoBean converterJson(Map<String, dynamic> json){
    ProdutoBean p = ProdutoBean();

      p.descricao = json['descricaoProduto'];
      p.codigo = json['codigo'];
      p.ordem = json['ordem'];
      p.codigoAdicionalDois = json['codigoAdicionalDois'];
      p.codigoBarra = json['codigoBarra'];
      p.precoUnitario = json['precoUnitario'];
      p.codigoAdicionalUm = json['codigoAdicionalUm'];
      p.obs = json['obs'];

    return p;
  }

  @override
  String toString() {
    return 'ProdutoBean{descricao: $descricao, codigo: $codigo, precoUnitario: $precoUnitario, ordem: $ordem}';
  }
}
