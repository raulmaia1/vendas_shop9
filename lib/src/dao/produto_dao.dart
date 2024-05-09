import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../bean/produto_bean.dart';

class ProdutoDao {


  Future<List<ProdutoBean>> procuraProdutoViaSQLServer(String descricao) async {

    final post = await http.post(
        Uri.parse('http://localhost:8080/shopRest/produtos'),
        headers: <String, String>{
          "Content-Type": "text/plain",
          'Accept': '*/*',
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "X-Requested-With,Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, GET"
        },
        body: jsonEncode(<String, String>{
          'descricao': descricao,
        }));

    if (post.statusCode == 201) {
      List<ProdutoBean> temp = (json.decode(post.body) as List).map((
          produtoBean) => ProdutoBean.converterJson(produtoBean)).toList();

      return Future<List<ProdutoBean>>.value(temp);

    }
    return Future<List<ProdutoBean>>.value([]);
  }

}
