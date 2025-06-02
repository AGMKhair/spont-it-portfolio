import 'package:flutter/material.dart';

class HoverWidget extends StatefulWidget {

  Widget child;
  final Color hoverColor;
  final Color normalColor;

  HoverWidget({
    Key? key,
    required this.child,
    this.hoverColor = const Color(0xFFC8C8C9),
    this.normalColor = const Color(0xFFF5F5F5),
  }) : super(key: key);

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..scale(_isHovered ? 1.06 : 1.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: _isHovered ? widget.hoverColor : widget.normalColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: _isHovered
              ? [
            BoxShadow(
                color: Colors.deepPurple.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 1,
                offset: Offset(0, 8))
          ]
              : [],
        ),
        padding: EdgeInsets.all(20),
        child: widget.child,
      ),
    );
  }
}
