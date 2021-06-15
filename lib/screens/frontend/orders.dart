// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/api/models/bill.dart';
import 'package:login/api/models/billdetail.dart';
import 'package:provider/provider.dart';
import 'package:login/api/services/lavapp_backend.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  static const Color bottomBar = Color(0xfff2b3b6);
  static const Color floatingButton = Color(0xffe38b90);
  @override
  Widget build(BuildContext context) {
    final List<BillItems> items = Provider.of<ServicesApi>(context).billItems;
    Provider.of<ServicesApi>(context).getBill();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: (items.length == 0)
            ? Center(child: CircularProgressIndicator())
            : Scrollbar(
                child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    floating: false,
                    snap: false,
                    expandedHeight: MediaQuery.of(context).size.height * 0.3,
                    backgroundColor: bottomBar,

                    // elevation: 0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'lib/assets/images/order.jpg',
                            fit: BoxFit.cover,
                          ),
                          DecoratedBox(
                              decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.0, 0.95),
                              end: Alignment(0.0, 0.0),
                              colors: <Color>[
                                Color(0x60000000),
                                Color(0x00000000),
                              ],
                            ),
                          ))
                        ],
                      ),
                      centerTitle: true,
                      title: Text(
                        'My Orders',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      Provider.of<ServicesApi>(context)
                          .callDetailData(items, index);
                      return Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Center(
                          child: _Card(items[index], index),
                        ),
                      );
                    }, childCount: items.length),
                  ),
                ],
              )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: floatingButton,
          elevation: 10,
          tooltip: 'Create new order',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final index;
  final BillItems items;

  const _Card(
    this.items,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            '',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
      title: Row(
        children: [
          Text(
            'Camisa',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '·',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
      subtitle: Text(
        'Listo en 2 dias',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Text(
        'Lavado...',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      onTap: () {},
    );
  }

  //     leading: Container(
  //         height: 60,
  //         width: 60,
  //         decoration: BoxDecoration(
  //             color: Colors.grey.withOpacity(0.3),
  //             borderRadius: BorderRadius.all(Radius.circular(10))),
  //         child: Icon(
  //           FontAwesomeIcons.tshirt,
  //           color: Colors.black54,
  //         )),
  //     title: Row(
  //       children: [
  //         Text(
  //           'Camisa',
  //           style: TextStyle(
  //             fontSize: 18,
  //           ),
  //         ),
  //         SizedBox(
  //           width: 5,
  //         ),
  //         Text(
  //           '·',
  //           style: TextStyle(
  //             fontSize: 20,
  //           ),
  //         ),
  //         SizedBox(
  //           width: 5,
  //         ),
  //         Text(
  //           'Plancado',
  //           style: TextStyle(
  //             fontSize: 18,
  //           ),
  //         ),
  //       ],
  //     ),
  //     subtitle: Text(
  //       'Listo en 2 dias',
  //       style: TextStyle(
  //         fontSize: 16,
  //       ),
  //     ),
  //     trailing: Text(
  //       'Lavado...',
  //       style: TextStyle(
  //         fontSize: 16,
  //       ),
  //     ),
  //     onTap: () {},
  //   );
  // }
}

///
///COMO RAYOS PUEDO PONER BILL EN ORDENES Y DE AHI QUE VAYA A OTRA PANTALLA, NO HAY NADA PARA ESO
///

///
///Que Cada Bill Tenga su cantidad de BillDetaild


