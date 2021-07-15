import 'package:flutter/material.dart';
import 'package:login/api/models/bill.dart';
import 'package:login/api/services/lavapp_backend.dart';
import 'package:provider/provider.dart';

import 'detail_orders_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final historyData = Provider.of<ServicesApi>(context).dataBill.data;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _BtnBack(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
              ),
              Container(
                  // color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    'Historial',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ))
            ]),
            Expanded(
                child: ListView.builder(
              itemCount: historyData.length,
              itemBuilder: (BuildContext context, int index) {
                return (historyData[index].active)
                    ? Container()
                    : _Card(i: index);
              },
            ))
          ],
        ),
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.topLeft,
          child: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final i;

  const _Card({this.i});

  @override
  Widget build(BuildContext context) {
    // final countStyleText =
    final bills = Provider.of<ServicesApi>(context).dataBill.data;
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20)),
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
          'Le Asistío: ${bills[i].trabajador.username}',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        SizedBox(
          width: 40,
        ),
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 100,
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
            Text('Cantidad de ordenes: ',
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
