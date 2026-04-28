import '../models/scan_result.dart';
import '../services/hive_service.dart';

class HistoryRepository {
  Future<void> addScan(ScanResult scan) async {
    await HiveService.saveScan(scan);
  }

  List<ScanResult> getHistory() {
    return HiveService.getAllScans();
  }

  Future<void> removeScan(int index) async {
    await HiveService.deleteScan(index);
  }

  Future<void> clearHistory() async {
    await HiveService.clearAll();
  }
}
