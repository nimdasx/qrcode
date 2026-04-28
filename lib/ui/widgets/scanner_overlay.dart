import 'package:flutter/material.dart';

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Darken background with a transparent hole in the middle
        CustomPaint(
          size: Size.infinite,
          painter: _ScannerOverlayPainter(),
        ),
        // Viewfinder frame
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Text(
              'Align QR code within the frame',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(0.5);
    
    final rect = Rect.fromLTWH(
      (size.width - 250) / 2,
      (size.height - 250) / 2,
      250,
      250,
    );
    
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(24));
    
    // Create a path that covers the whole screen but excludes the center rectangle
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
        Path()..addRRect(rrect),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
