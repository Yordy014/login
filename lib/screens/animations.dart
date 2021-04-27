import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Animations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRectangle(),
      ),
    );
  }
}

class AnimatedRectangle extends StatefulWidget {
  @override
  _AnimatedRectangleState createState() => _AnimatedRectangleState();
}

class _AnimatedRectangleState extends State<AnimatedRectangle>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> opacityOut;
  Animation<double> moveRight;
  Animation<double> makeBigger;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.repeat();
      }
      // } else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });

    // Rotacion hasta 2.0
    // rotation = Tween(begin: 0.0, end: 2.0).animate(controller);

    //Rotacion perfecta 2 vueltas
    // rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);

    //Animaciones curvas
    rotation = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    // Opacidad
    // opacity = Tween(begin: 0.1, end: 1.0).animate(controller);

    // Opacidad or intervalo de tiempo
    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceIn)));

    // Eliminar por opacidad
    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0)));

    // Mover a la derecha
    moveRight = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.5, curve: Curves.easeIn)));

    // Agrandar
    makeBigger = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.5, curve: Curves.easeIn)));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        // Para ver el estado de las animaciones en pantalla
        // print('Animacion: ${Animacion.value}');
        // return Transform.translate(
        //   offset: Offset(moveRight.value, 0),
        //   child: Transform.rotate(
        //       angle: rotation.value,
        //       child: Opacity(
        //         opacity: opacity.value - opacityOut.value,
        //         child: Transform.scale(
        //           child: child,
        //           scale: makeBigger.value,
        //         ),
        //       )),
        // );
        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: child,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
