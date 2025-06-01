import 'package:flutter/material.dart';
import 'package:spontit/util/colors_util.dart';

class DecorativeSection extends StatelessWidget {
  final Widget child;

  const DecorativeSection({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Decorations
        Positioned(
          top: -40,
          left: -40,
          child: _circleDecoration(100, Colors.deepPurple.shade50),
        ),
        Positioned(
          bottom: -30,
          right: -30,
          child: _circleDecoration(80, Colors.deepPurple.shade100),
        ),
        Positioned(
          top: 100,
          right: 40,
          child: _triangleDecoration(60, Colors.deepPurple.shade50),
        ),
        Positioned(
          bottom: 80,
          left: 60,
          child: _triangleDecoration(40, Colors.deepPurple.shade100),
        ),

        // Content on top
        Container(
          color: ColorsUtil.colorCream,
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: child,
        ),
      ],
    );
  }

  Widget _circleDecoration(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _triangleDecoration(double size, Color color) {
    return CustomPaint(
      size: Size(size, size),
      painter: _TrianglePainter(color),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  _TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
