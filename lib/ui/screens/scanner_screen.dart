import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../providers/history_provider.dart';
import '../../data/models/scan_result.dart';
import '../widgets/scanner_overlay.dart';
import '../widgets/result_bottom_sheet.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  MobileScannerController controller = MobileScannerController();
  bool isScanning = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (!isScanning) return;

    final barcode = capture.barcodes.first;
    if (barcode.rawValue != null) {
      setState(() => isScanning = false);
      final value = barcode.rawValue!;

      // Save to history
      ref.read(scanHistoryProvider.notifier).addScan(value);

      // Show result
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        builder: (context) => ResultBottomSheet(
          result: ScanResult(value: value, timestamp: DateTime.now()),
        ),
      ).then((_) {
        setState(() => isScanning = true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.pushNamed(context, '/history'),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: _onDetect,
          ),
          const ScannerOverlay(),
          Positioned(
            bottom: 50,
            right: 20,
            child: FloatingActionButton(
              onPressed: () => controller.toggleTorch(),
              child: const Icon(Icons.flashlight_on),
            ),
          ),
        ],
      ),
    );
  }
}
