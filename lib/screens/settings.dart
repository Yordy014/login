import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login/api/services/lavapp_backend.dart';
import 'package:login/api/services/save_login.dart';
// import 'package:login/screens/components/profile_settings.dart';
// import 'package:login/screens/components/change_pass.dart';
import 'package:login/screens/settings_chance_page.dart';
// import 'package:login/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'LogIn.dart';

// import 'LogIn.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // static const Color bottomBar = Color(0xfff2b3b6);
  // static const Color floatingButton = Color(0xffe38b90);
  @override
  Widget build(BuildContext context) {
    final dataUser = Provider.of<ServicesApi>(context).getLoginModel ?? null;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Configuración',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            backgroundColor: Colors.grey.shade50,
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Nombre y Apellido:',
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              ),
                        ),
                        subtitle: Text(
                          '${dataUser.user.person.firstName} ${dataUser.user.person.lastName}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        trailing: GestureDetector(
                            child: Icon(Icons.settings),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ChangeSettings()))),
                      ),
                    ),
                  ],
                ),
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(20, 8, 20, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Numero Celular'),
                      subtitle: Text('${dataUser.user.person.telNumber}'),
                      leading: Icon(Icons.phone),
                      // trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Direccion'),
                      subtitle: Text('${dataUser.user.person.address}'),
                      leading: Icon(Icons.location_on),
                      // trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(30),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                width: 200,
                child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Cerrar Sesión'),
                        Icon(Icons.logout_outlined)
                      ],
                    ),
                    onPressed: () {
                      Provider.of<ServicesApi>(context, listen: false)
                          .setPassword = '';
                      Provider.of<ServicesApi>(context, listen: false)
                          .setEmail = '';
                      PreferenciasUsuario().removerUsuario();
                      return Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LogIn()));
                    },
                    color: LogIn.floatingButton,
                    // elevation: 10,
                    minWidth: 300,
                    height: 50,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'lib/assets/images/gear.png',
                      color: const Color.fromRGBO(255, 255, 255, 0.15),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Términos y Condiciones de Uso',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('INFORMACIÓN RELEVANTE',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Es requisito necesario para la adquisición de los productos que se ofrecen en este sitio, que lea y acepte los siguientes Términos y Condiciones que a continuación se redactan. El uso de nuestros servicios así como la compra de nuestros productos implicará que usted ha leído y aceptado los Términos y Condiciones de Uso en el presente documento. Todas los productos  que son ofrecidos por nuestro sitio web pudieran ser creadas, cobradas, enviadas o presentadas por una página web tercera y en tal caso estarían sujetas a sus propios Términos y Condiciones. En algunos casos, para adquirir un producto, será necesario el registro por parte del usuario, con ingreso de datos personales fidedignos y definición de una contraseña.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'El usuario puede elegir y cambiar la clave para su acceso de administración de la cuenta en cualquier momento, en caso de que se haya registrado y que sea necesario para la compra de alguno de nuestros productos. @yordyrodrigues y @odalmipaulino no asume la responsabilidad en caso de que entregue dicha clave a terceros.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Todas las compras, servicios y transacciones que se lleven a cabo por medio de este sitio web y/o aplicación, están sujetas a un proceso de confirmación y verificación, el cual podría incluir la verificación del stock y disponibilidad de producto, validación de la forma de pago, validación de la factura (en caso de existir) y el cumplimiento de las condiciones requeridas por el medio de pago seleccionado. En algunos casos puede que se requiera una verificación por medio de correo electrónico.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('LICENCIA',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'LavApp  a través de su sitio web y/o aplicación concede una licencia para que los usuarios utilicen  los productos que son vendidos en este sitio web de acuerdo a los Términos y Condiciones que se describen en este documento.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('USO NO AUTORIZADO',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'En caso de que aplique (para venta de software, templetes, u otro producto de diseño y programación) usted no puede colocar uno de nuestros productos o servicios, modificado o sin modificar, en un CD, sitio web o ningún otro medio y ofrecerlos para la redistribución o la reventa de ningún tipo.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('PROPIEDAD',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Usted no puede declarar propiedad intelectual o exclusiva a ninguno de nuestros productos, modificado o sin modificar. Todos los productos son propiedad  de los proveedores del contenido. En caso de que no se especifique lo contrario, nuestros productos se proporcionan  sin ningún tipo de garantía, expresa o implícita. En ningún esta compañía será  responsables de ningún daño incluyendo, pero no limitado a, daños directos, indirectos, especiales, fortuitos o consecuentes u otras pérdidas resultantes del uso o de la imposibilidad de utilizar nuestros productos.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('COMPROBACIÓN ANTIFRAUDE',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'La compra del cliente puede ser aplazada para la comprobación antifraude. También puede ser suspendida por más tiempo para una investigación más rigurosa, para evitar transacciones fraudulentas.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('PRIVACIDAD',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Este @yordyrodrigues y @odalmipaulino garantiza que la LaVapp y la información personal que usted envía cuenta con la seguridad necesaria. Los datos ingresados por usuario o en el caso de requerir una validación de los pedidos no serán entregados a terceros, salvo que deba ser revelada en cumplimiento a una orden judicial o requerimientos legales.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'LavApp reserva los derechos de cambiar o de modificar estos términos sin previo aviso.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ))
            ],
          ))),
    );
  }
}
