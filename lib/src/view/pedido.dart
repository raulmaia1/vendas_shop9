import 'package:flutter/material.dart';
import 'package:mssql_connection/mssql_connection.dart';

import '../bean/produto_bean.dart';

class Pedido extends StatefulWidget {
  const Pedido({super.key});

  @override
  State<StatefulWidget> createState() {
    return PedidoState();
  }
}

class PedidoState extends State<Pedido> {
  List<ProdutoBean> lista = [];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(lista.toString()),
        IconButton(
            onPressed: () {
              conection().then((value) => print(value));
              print(lista);
            },
            icon: Icon(Icons.ac_unit))
      ],
    ));
  }

  Future<bool> conection() async {
    return await MssqlConnection.getInstance().connect(
      ip: '192.168.194.119',
      port: '1435',
      databaseName: 'S9_Real',
      username: 'sa',
      password: 'Senha123',
      timeoutInSeconds: 15,
    );
  }

  //   try {
  //     _connectToSqlServerDirectlyPlugin
  //         .initializeConnection(
  //           //serverIp
  //           ,
  //           //databaseName
  //           '',
  //           //username
  //           '',
  //           //password
  //           '',
  //           //instance
  //           instance: 'Multigado',
  //         )
  //         .then((value) => {
  //               if (value)
  //                 {
  //                   _connectToSqlServerDirectlyPlugin
  //                       .getRowsOfQueryResult(
  //                           "select TOP(1) from dbo.ProdServ where codigo = 1")
  //                       .then((value) {
  //                     if (value.runtimeType == String) {
  //                       onError = value.toString();
  //                     } else {
  //                       List<Map<String, dynamic>> tempResult =
  //                           value.cast<Map<String, dynamic>>();
  //                       for (var element in tempResult) {
  //                         lista.add(
  //                             ProdutoBean(element['Ordem'], element['Codigo']));
  //                       }
  //                     }
  //                   })
  //                 }
  //             });
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }
}
