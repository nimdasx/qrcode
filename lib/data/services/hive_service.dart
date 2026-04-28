import 'package:hive_flutter/hive_flutter.dart';
import '../models/scan_result.dart';

class HiveService {
  static const String _historyBoxName = 'scan_history';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ScanResultAdapter());
    await Hive.openBox<ScanResult>(_historyBoxName);
  }

  static Box<ScanResult> get historyBox => Hive.box<ScanResult>(_historyBoxName);

  static Future<void> saveScan(ScanResult scan) async {
    await historyBox.add(scan);
  }

  static Future<void> deleteScan(int index) async {
    await historyBox.deleteAt(index);
  }

  static List<ScanResult> getAllScans() {
    return historyBox.values.toList()..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  static Future<void> clearAll() async {
    await historyBox.clear();
  }
}
