// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/api/services/lavapp_backend.dart';
import 'package:provider/provider.dart';

import 'components/widgets_orders/orders_appbar.dart';
import 'components/widgets_orders/orders_listItems.dart';

class Orders extends StatelessWidget {
  // static const Color floatingButton = Color(0xffe38b90);
  const Orders({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Provider.of<ServicesApi>(context).getOrders();
    Provider.of<ServicesApi>(context).isLoading = true;
    final bill = Provider.of<ServicesApi>(context).dataBill;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: (bill.data?.length == 0 ?? 0)
          ? Center(
              child: Container(
              width: 200,
              child: Text(
                'No posee ordenes! Si tiene órdenes y no se encuentran aquí, por favor comunîquese con la lavandería.',
                textAlign: TextAlign.center,
              ),
            ))
          : Scrollbar(
              child: CustomScrollView(
              slivers: [
                OrdersAppBar(bill),
                OrdersListItem(),
              ],
            )),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: floatingButton,
      //   elevation: 10,
      //   tooltip: 'Create new order',
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {},
      // ),
    );
  }
}

///
///COMO RAYOS PUEDO PONER BILL EN ORDENES Y DE AHI QUE VAYA A OTRA PANTALLA, NO HAY NADA PARA ESO
///

///
///Que Cada Bill Tenga su cantidad de BillDetaild
