import 'package:flutter/material.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:vendas/src/controller/pesquisa_produto_controller.dart';
import 'package:vendas/src/dao/produto_dao.dart';

import '../bean/produto_bean.dart';

class Pedido extends StatefulWidget {
  const Pedido({super.key});

  @override
  State<StatefulWidget> createState() {
    return PedidoState();
  }
}

class PedidoState extends State<Pedido> {


  @override
  Widget build(BuildContext context) {
    var venda = PesquisaProdutoController.venda;
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Padding(
            padding: EdgeInsets.all(25.0),
            child:  Column(

              children: [
                Text("Resumo da Venda",  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                )),
                Text("Resumo da Venda",  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15

                )),

                Flexible(child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Desconto em %",
                        border: OutlineInputBorder()
                    )
                )),
                SizedBox(height: 20.0,  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Operação de Venda",
                      border: OutlineInputBorder()
                    )

                )
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  shrinkWrap: true,
                  itemCount: venda.listaPedido.length,
                  itemBuilder: ((context, index) => Card(
                    color: Colors.amber[700],
                    child: ListTile(
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_rounded),
                          onPressed: ()
                          {

                            setState(() {
                              venda.listaPedido.remove([index]);
                            });
                          }),
                        title: Text(venda.listaPedido[index].descricao),
                        subtitle: Text(venda.listaPedido[index].codigo)),
                  )),
                ),

                BackButton(
                    onPressed: () {

                    },
                )
              ]
            )));
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
