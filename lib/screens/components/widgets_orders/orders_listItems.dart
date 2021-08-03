import 'package:flutter/material.dart';
import 'package:login/api/models/bill.dart';

import 'package:login/api/services/lavapp_backend.dart';
import 'package:provider/provider.dart';

import '../../detail_orders_page.dart';

class OrdersListItem extends StatelessWidget {
  const OrdersListItem({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<ServicesApi>(context).getOrders();
    // final bills = Provider.of<ServicesApi>(context).dataBill.data.length;

    final billslength =
        Provider.of<ServicesApi>(context).dataBill.data?.length ?? 0;
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return
            // (!bills[index].active)
            //     ? Container()
            //     :
            Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Center(
            child: _Card(index),
          ),
        );
      }, childCount: billslength ?? 0),
    );
  }
}

class _Card extends StatelessWidget {
  final i;

  const _Card(this.i);

  @override
  Widget build(BuildContext context) {
    // final countStyleText =
    final bills = Provider.of<ServicesApi>(context).dataBill.data;
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                _HeaderOrderList(bills: bills, i: i),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //   // color: Colors.red,
                //   // width: 200,
                //   height: 200,
                //   child: ListView.builder(
                //       itemCount: bills[i].billDetaiLs?.length,
                //       itemBuilder: (context, index) {
                //         return Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: <Widget>[
                //               Text(
                //                   '${bills[i].billDetaiLs[index].serviceType.clotheType.clotheType}'),
                //               SizedBox(
                //                 width: 20,
                //               ),
                //               Text('-'),
                //               SizedBox(
                //                 width: 20,
                //               ),
                //               Text('${bills[i].billDetaiLs[index].currentDept}')
                //             ]);
                //       }),
                // ),
                _FootOrderList(bills: bills, i: i)
              ],
            ),
            // SizedBox(width: 30),
            Container(
                width: 20,
                height: 20,
                child: Image.asset('lib/assets/icons/right-arrow.png'))
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DetailOrder(i: i)));
      },
    );
  }
}

class _FootOrderList extends StatelessWidget {
  const _FootOrderList({
    Key key,
    @required this.bills,
    @required this.i,
  }) : super(key: key);

  final List<Datum> bills;
  final i;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Le Asistío: ${bills[i].cliente.person.firstName} ${bills[i].cliente.person.lastName}',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        SizedBox(
          width: 40,
        ),
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 95,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white60),
          child: Text(
            'Total: \$${bills[i]?.subTotal}',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}

class _HeaderOrderList extends StatelessWidget {
  const _HeaderOrderList({
    Key key,
    @required this.bills,
    @required this.i,
  }) : super(key: key);

  final List<Datum> bills;
  final i;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // color: Colors.red,
          width: 300,
          alignment: Alignment.bottomLeft,
          child: Text(
            '${bills[i].currentDate.day}/${bills[i].currentDate.month}/${bills[i].currentDate.year}',
            style: TextStyle(fontSize: 14, color: Colors.black26),
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Cantidad de piezas: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            SizedBox(width: 20),
            Container(
              // alignment: Alignment.center,
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Color(0xfff2b3b6),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  '${bills[i].billDetaiLs?.length}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white54,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),

            // Text(
            //   'Total: \$${bills[i]?.subTotal}',
            //   style: TextStyle(fontSize: 20),
            // )
          ],
        ),
      ],
    );
  }
}
