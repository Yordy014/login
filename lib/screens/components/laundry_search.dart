import 'package:flutter/material.dart';
import 'package:login/api/services/lavapp_backend.dart';
import 'package:login/screens/LogIn.dart';
import 'package:provider/provider.dart';

class LaundrySearch extends StatefulWidget {
  @override
  _LaundrySearchState createState() => _LaundrySearchState();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class _LaundrySearchState extends State<LaundrySearch> {
  @override
  Widget build(BuildContext context) {
    final dataServices = Provider.of<ServicesApi>(context).dataServices;
    final clotheLength =
        Provider.of<ServicesApi>(context).dataServices.data?.length ?? 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'LavApp',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          backgroundColor: Colors.grey.shade50,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Bienvenido a LaVapp',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'LaVapp es nueva alaida a la hora de dar seguimientos a sus piezas de ropas que dejes en la lavandería. En la Opción al lado del icono de casa, podra ver las prendas que tiene en la lavandería. Al dar tap a una de ella puede ver el detalle de la misma, Tambien puede ver el estado en que se cuentra, desde que el estado sea igual Recepción puede pasar a recoger sus prendas.',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Cualquier inquietud, no dude en llamar a la Lavandería para mayor seguimiento',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _OfertaCamisas(),
                SizedBox(
                  height: 20,
                ),
                _OfertaDePantalones()
              ],
            ),
          ),
        ),
        // body: Container(
        //   padding: EdgeInsets.all(2),

        //   // height: MediaQuery.of(context).size.height * 1,
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [Text('Pieza'), Text('Servicio'), Text('Precio')],
        //       ),
        //       Container(
        //         height: MediaQuery.of(context).size.height * 0.75,
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: ListView.builder(
        //               itemCount: clotheLength ?? 0,
        //               itemBuilder: (context, index) {
        //                 final servicesLength = Provider.of<ServicesApi>(context)
        //                         .dataServices
        //                         .data[index]
        //                         .serviceTypEs
        //                         ?.length ??
        //                     0;

        //                 return Container(
        //                   padding: EdgeInsets.all(2),
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                     crossAxisAlignment: CrossAxisAlignment.center,
        //                     children: [
        //                       Container(
        //                         padding: EdgeInsets.all(3),
        //                         decoration: BoxDecoration(
        //                             color: Colors.grey.withOpacity(0.3),
        //                             borderRadius: BorderRadius.circular(20)),
        //                         child: Row(
        //                           mainAxisAlignment: MainAxisAlignment.start,
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             Container(
        //                               width: MediaQuery.of(context).size.width *
        //                                   0.25,
        //                               child: Text(
        //                                   '${dataServices.data[index].clotheType}:'),
        //                             ),
        //                             SizedBox(
        //                               width: 30,
        //                             ),
        //                             Row(
        //                               mainAxisAlignment: MainAxisAlignment.end,
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.end,
        //                               children: [
        //                                 Container(
        //                                   height: 60,
        //                                   width: MediaQuery.of(context)
        //                                           .size
        //                                           .width *
        //                                       0.6,
        //                                   child: ListView.builder(
        //                                       // shrinkWrap: true,
        //                                       physics:
        //                                           NeverScrollableScrollPhysics(),
        //                                       itemCount: servicesLength ?? 0,
        //                                       itemBuilder: (context, i) {
        //                                         return Container(
        //                                           // alignment: Alignment,
        //                                           child: Row(
        //                                             mainAxisAlignment:
        //                                                 MainAxisAlignment
        //                                                     .spaceBetween,
        //                                             children: [
        //                                               Container(
        //                                                 child: Text(
        //                                                   '${dataServices.data[index].serviceTypEs[i].type}',
        //                                                   style: TextStyle(
        //                                                       fontSize: 2),
        //                                                 ),
        //                                               ),
        //                                               SizedBox(width: 1),
        //                                               Container(
        //                                                 child: Text(
        //                                                     '${dataServices.data[index].serviceTypEs[i].price}'),
        //                                               ),
        //                                               SizedBox(width: 1),
        //                                             ],
        //                                           ),
        //                                         );
        //                                       }),
        //                                 )
        //                               ],
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                       // SizedBox(
        //                       //   height: 1,
        //                       // ),
        //                     ],
        //                   ),
        //                 );
        //               }),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

class _OfertaCamisas extends StatelessWidget {
  const _OfertaCamisas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: LogIn.bottomBar),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Container(
                width: 150,
                height: double.infinity,
                child: FadeInImage(
                    fit: BoxFit.fill,
                    placeholder: AssetImage(
                        'lib/assets/images/no-image-placeholder.png'),
                    image: NetworkImage(
                        'https://okdiario.com/img/2018/03/24/como-doblar-camisas-correctamente-655x368.jpg')),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Oferta! ',
                  style: TextStyle(fontSize: 40),
                ),
                Container(
                  child: Text(
                    '80% de descuento',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  child: Text(
                    'En todas las camisas',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _OfertaDePantalones extends StatelessWidget {
  const _OfertaDePantalones({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Rebajas ',
                  style: TextStyle(fontSize: 40),
                ),
                Container(
                  child: Text(
                    'los servicios de jeans ',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  child: Text(
                    'tienen rebaja de 50%',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            ClipOval(
              child: Container(
                width: 150,
                height: double.infinity,
                child: FadeInImage(
                    fit: BoxFit.fill,
                    placeholder: AssetImage(
                        'lib/assets/images/no-image-placeholder.png'),
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlNDKSCgjiyPyzzwkqye6Kzr1xIfBdZncfJBBdGe65QbLaE8TvvEnraPg7bkEMWBFbZTU&usqp=CAU')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
