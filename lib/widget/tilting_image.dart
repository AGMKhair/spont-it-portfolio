import 'package:flutter/material.dart';

class TiltingImage extends StatefulWidget {
  final String imagePath;
  final double width;

  const TiltingImage({
    super.key,
    required this.imagePath,
    required this.width,
  });

  @override
  State<TiltingImage> createState() => _TiltingImageState();
}

class _TiltingImageState extends State<TiltingImage> {
  double _tiltX = 0.5;
  double _tiltY = 0.5;

  void _onHover(PointerEvent event) {
    final size = Size(widget.width, widget.width); // Assuming square for simplicity
    final dx = event.localPosition.dx;
    final dy = event.localPosition.dy;

    final halfWidth = size.width / 2;
    final halfHeight = size.height / 2;

    setState(() {
      _tiltY = (dx - halfWidth) / halfWidth * 0.1;
      _tiltX = -(dy - halfHeight) / halfHeight * 0.1;
    });
  }

  void _resetTilt(PointerEvent event) {
    setState(() {
      _tiltX = .5;
      _tiltY = .5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: _resetTilt,
      onHover: _onHover,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..rotateX(_tiltX)
          ..rotateY(_tiltY),
        child: Image.asset(
          widget.imagePath,
          width: widget.width,
        ),
      ),
    );
  }
}
