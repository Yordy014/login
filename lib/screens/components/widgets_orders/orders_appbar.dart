import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/api/models/bill.dart';

class OrdersAppBar extends StatefulWidget {
  static const Color bottomBar = Color(0xfff2b3b6);

  OrdersAppBar(
    BillModel bill, {
    Key key,
  }) : super(key: key);

  @override
  _OrdersAppBarState createState() => _OrdersAppBarState();
}

class _OrdersAppBarState extends State<OrdersAppBar> {
  BillModel bill;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      backgroundColor: OrdersAppBar.bottomBar,

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
            )),
            // Positioned(
            //   top: 30,
            //   right: 30,
            //   child: GestureDetector(
            //     onTap: () {
            //       if (bill != null) {
            //         return Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (BuildContext context) => HistoryPage()));
            //       } else {
            //         return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //           backgroundColor: Colors.grey,
            //           content: Text(
            //             'No posee historial de ordenes',
            //             style: TextStyle(fontSize: 14),
            //             textAlign: TextAlign.center,
            //           ),
            //           duration: Duration(seconds: 5),
            //         ));
            //       }
            //     },
            //     child: Container(
            //       alignment: Alignment.center,
            //       width: 35,
            //       height: 35,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(50),
            //         color: Color(0xfff2b3b6),
            //       ),
            //       child: Icon(
            //         Icons.history,
            //         size: 30,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
        centerTitle: true,
        title: Text(
          'Mis Órdenes',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
