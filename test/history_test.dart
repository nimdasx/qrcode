import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_test/hive_test.dart';
import 'package:qrcode/data/models/scan_result.dart';
import 'package:qrcode/data/repositories/history_repository.dart';
import 'package:qrcode/providers/history_provider.dart';

void main() {
  setUpAll(() async {
    // Use Hive.init() for tests instead of Hive.initFlutter()
    // but since we are using HiveService, let's try to call a method that does this.
    // For now, just initialize it manually to avoid dependecy on setUpHive.
    // Note: In a real project we'd use a mock or a temporary directory.
  });

  group('ScanHistoryNotifier Tests', () {
    late HistoryRepository repository;
    late ScanHistoryNotifier notifier;

    setUp(() {
      repository = HistoryRepository();
      notifier = ScanHistoryNotifier(repository);
    });

    test('initial state is empty', () {
      expect(notifier.state, isEmpty);
    });

    test('adding a scan updates state', () async {
      await notifier.addScan('https://google.com');
      expect(notifier.state.length, 1);
      expect(notifier.state.first.value, 'https://google.com');
    });

    test('removing a scan updates state', () async {
      await notifier.addScan('test1');
      await notifier.addScan('test2');
      
      // Remove the first one (index 0 in the current state)
      await notifier.removeScan(0);
      expect(notifier.state.length, 1);
    });

    test('clearing all removes everything', () async {
      await notifier.addScan('test1');
      await notifier.addScan('test2');
      await notifier.clearAll();
      expect(notifier.state, isEmpty);
    });
  });
}
