// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.



import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vendas/src/bean/produto_bean.dart';

Future<void> main() async {

  final post = await http.post(
      Uri.parse('http://localhost:8080/shopRest/produtos'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
      'descricao': 'Proteinado',
      }));

  if (post.statusCode == 201) {

    List<ProdutoBean> list  = (json.decode(post.body) as List).map((produtoBean) => ProdutoBean.converterJson(produtoBean)).toList();

    list.forEach((element) {
      print(element.descricao + '/n');
    });



  }
}
