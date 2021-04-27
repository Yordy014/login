import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SquareHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff0277bd),
    );
  }
}

class CircularHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff0277bd),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class TriangularPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class PeakHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPeakPainter(),
      ),
    );
  }
}

class CurveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvePainter(),
      ),
    );
  }
}

class CurveHeaderGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvePainterGradient(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    // Properties
    paint.color = Color(0xff0277bd);
    paint.style = PaintingStyle.fill;
    // paint.strokeWidth = 5;

    // Draw with path and paint
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    // Properties
    paint.color = Color(0xff0277bd);
    paint.style = PaintingStyle.fill;
    // paint.strokeWidth = 5;

    // Draw with path and paint
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderPeakPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    // Properties
    paint.color = Color(0xff0277bd);
    paint.style = PaintingStyle.fill;
    // paint.strokeWidth = 5;

    // Draw with path and paint
    path.lineTo(0, size.height * 0.30);
    path.lineTo(size.width * 0.5, size.height * 0.40);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    // Properties
    paint.color = Color(0xff0277bd);
    paint.style = PaintingStyle.fill;
    // paint.strokeWidth = 5;

    // Draw with path and paint
    path.lineTo(0, size.height * 0.30);

    // x1 and y1 its where the curve will point
    // x2 and y2 its where curve will finish

    // down curve
    // path.quadraticBezierTo(
    //     size.width * 0.50, size.height * 0.40, size.width, size.height * 0.30);
    // path.lineTo(size.width, 0);

    // Up curve
    // path.quadraticBezierTo(
    //     size.width * 0.50, size.height * 0.20, size.width, size.height * 0.30);
    // path.lineTo(size.width, 0);

    // Side curve
    // path.quadraticBezierTo(
    //     size.width * 0.20, size.height * 0.20, size.width, size.height * 0.30);
    // path.lineTo(size.width, 0);

    // Wave
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.25,
        size.width * 0.50, size.height * 0.30);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.35, size.width, size.height * 0.30);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderCurvePainterGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //offset x,y position
    final rect = Rect.fromCircle(center: Offset(0.0, 55.0), radius: 180);

    final Gradient gradient = LinearGradient(
        colors: [Colors.grey.shade300, Colors.white, Colors.lightGreen],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.2, 0.5, 1]);

    final paint = Paint()..shader = gradient.createShader(rect);
    final path = Path();

    // Properties
    // paint.color = Color(0xff0277bd);
    paint.style = PaintingStyle.fill;
    // paint.strokeWidth = 5;

    // Initial line
    path.lineTo(0, size.height * 0.30);

    // Wave
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.25,
        size.width * 0.50, size.height * 0.30);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.35, size.width, size.height * 0.30);

    // final line
    path.lineTo(size.width, 0);

    // Draw our path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
