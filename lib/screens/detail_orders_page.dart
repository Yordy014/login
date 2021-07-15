import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/api/services/lavapp_backend.dart';
import 'package:provider/provider.dart';

class DetailOrder extends StatelessWidget {
  final i;

  static const Color bottomBar = Color(0xfff2b3b6);

  const DetailOrder({Key key, this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<ServicesApi>(context).dataBill.data;
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Color(0xfff2b3b6),
          height: 50,
        ),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: bottomBar,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: _Header(i: i),
        ),

        Expanded(
            child: ListView.builder(
                itemCount: detail[i].billDetaiLs.length,
                itemBuilder: (context, index) {
                  return _CardDetail(i: i, index: index);
                })),
        // Expanded(child:
        // ListView.builder(itemBuilder: itemBuilder))
      ],
    ));
  }
}

class _CardDetail extends StatelessWidget {
  final i;
  final index;
  const _CardDetail({
    Key key,
    this.i,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<ServicesApi>(context).dataBill.data;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.3)),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(FontAwesomeIcons.tshirt),
            SizedBox(
              width: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Prenda: ${detail[i].billDetaiLs[index].serviceType.clotheType.clotheType}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Estado: ${detail[i].billDetaiLs[index].department.departmentName}',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            // Text(
            //   'Pantalon',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            // ),
            // Text(
            //   'Lavado',
            //   style: TextStyle(fontSize: 16),
            // ),

            Container(
              child: Text(
                  '\$${detail[i].billDetaiLs[index].serviceType.price}.00',
                  style: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final i;
  const _Header({
    Key key,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<ServicesApi>(context).dataBill.data;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BtnBack(),
        // SizedBox(
        //     // width: 40,
        //     ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // alignment: Alignment.bottomRight,
              child: Text(
                'Detalle de Orden',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Total: ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black38,
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 30),
        Container(
          child: Text(
            '\$${detail[i].subTotal}.00',
            style: TextStyle(fontSize: 28),
          ),
        )
      ],
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        alignment: Alignment.topLeft,
        child: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
