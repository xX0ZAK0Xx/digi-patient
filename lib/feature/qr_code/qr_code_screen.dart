// ignore_for_file: use_build_context_synchronously

import 'dart:ui';
import 'package:digi_patient/core/colors.dart';
import 'package:digi_patient/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vibration/vibration.dart';

import 'scan_result_screen.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> with SingleTickerProviderStateMixin {
  bool _isScanned = false;
  late final AnimationController _laserController;
  late final Animation<double> _laserAnimation;

  @override
  void initState() {
    super.initState();
    _laserController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _laserAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _laserController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _laserController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) async {
    if (_isScanned) return;

    final String? code = capture.barcodes.first.rawValue;
    if (code != null) {
      _isScanned = true;

      // Vibrate strongly
      if (await Vibration.hasVibrator()) {
        Vibration.vibrate(duration: 300);
      }

      // Navigate to result screen
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ScannedResultScreen(data: code),
        ),
      );

      // Reset
      _isScanned = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    const double scanBoxSize = 250;

    return Scaffold(
      body: Stack(
        children: [
          // Camera preview
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.normal,
              facing: CameraFacing.back,
            ),
            onDetect: _onDetect,
          ),

          // Solid black overlay with transparent cutout
          Positioned.fill(
            child: Stack(
              children: [
                Container(color: Colors.black.withValues(alpha: 0.7)),
                Center(
                  child: ClipPath(
                    clipper: HoleClipper(scanBoxSize),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Scan box border
          Center(
            child: Container(
              width: scanBoxSize,
              height: scanBoxSize,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(AppSizes.radiusBig),
              ),
            ),
          ),

          // Laser beam animation
          Center(
            child: SizedBox(
              width: scanBoxSize,
              height: scanBoxSize,
              child: AnimatedBuilder(
                animation: _laserAnimation,
                builder: (_, __) {
                  return CustomPaint(
                    painter: LaserPainter(_laserAnimation.value),
                  );
                },
              ),
            ),
          ),

          // Header
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Scan a QR Code',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 4, color: Colors.black45)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class HoleClipper extends CustomClipper<Path> {
  final double boxSize;

  HoleClipper(this.boxSize);

  @override
  Path getClip(Size size) {
    final double left = (size.width - boxSize) / 2;
    final double top = (size.height - boxSize) / 2;

    return Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(left, top, boxSize, boxSize),
        const Radius.circular(16),
      ))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LaserPainter extends CustomPainter {
  final double position; // 0.0 to 1.0

  LaserPainter(this.position);

  @override
  void paint(Canvas canvas, Size size) {
    final double y = size.height * position;
    final Paint paint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.7)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
  }

  @override
  bool shouldRepaint(LaserPainter oldDelegate) => oldDelegate.position != position;
}
