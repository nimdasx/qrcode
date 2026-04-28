import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/services/hive_service.dart';
import 'core/theme.dart';
import 'ui/screens/scanner_screen.dart';
import 'ui/screens/history_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(
    const ProviderScope(
      child: QRScannerApp(),
    ),
  );
}

class QRScannerApp extends StatelessWidget {
  const QRScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const ScannerScreen(),
        '/history': (context) => const HistoryScreen(),
      },
    );
  }
}
