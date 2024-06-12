import 'package:flutter/material.dart';

class BottomEllipticalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double radius = width / 2;

    Path path = Path();
    path.lineTo(0, height); // Start from top-left corner
    path.quadraticBezierTo(width * 0.5, height - 60, width, height);
    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipShadowPath extends StatelessWidget {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  const ClipShadowPath(
      {super.key,
      required this.shadow,
      required this.clipper,
      required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomPaint(
          painter: _ShadowPainter(clipper: clipper, shadow: shadow),
          child: SizedBox(
            height: size.height * 0.22,
            width: size.width,
          ),
        ),
        ClipPath(
          clipper: clipper,
          child: child,
        ),
      ],
    );
  }
}

class _ShadowPainter extends CustomPainter {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;

  _ShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = shadow.color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadow.blurRadius);
    final clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
