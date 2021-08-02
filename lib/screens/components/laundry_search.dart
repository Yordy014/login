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
    Provider.of<ServicesApi>(context).dataServices.data?.length;
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
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'LaVapp es su nueva aliada a la hora de dar seguimiento a sus piezas de ropas que deje en la lavandería. En la Opción al lado del icono de casa, podra ver las prendas que tiene en la lavandería. Al dar clic a una de ella puede ver el detalle de la misma, También puede ver el estado en que se encuentra, desde que el estado sea igual a "Recepción" puede pasar a retirar sus prendas.',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Cualquier inquietud, no dude en llamar a la lavandería para dar mejor soporte y mayor seguimiento.',
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
                width: 190,
                height: 190,
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
                  '¡Oferta! ',
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
                    'en todas las camisas',
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
                    'Los servicios de jeans ',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  child: Text(
                    'tienen rebaja de un 50%',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            ClipOval(
              child: Container(
                width: 190,
                height: 190,
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
