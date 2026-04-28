import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/history_repository.dart';
import '../data/models/scan_result.dart';

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return HistoryRepository();
});

final scanHistoryProvider = StateNotifierProvider<ScanHistoryNotifier, List<ScanResult>>((ref) {
  return ScanHistoryNotifier(ref.watch(historyRepositoryProvider));
});

class ScanHistoryNotifier extends StateNotifier<List<ScanResult>> {
  final HistoryRepository _repository;

  ScanHistoryNotifier(this._repository) : super([]) {
    _loadHistory();
  }

  void _loadHistory() {
    state = _repository.getHistory();
  }

  Future<void> addScan(String value) async {
    final scan = ScanResult(
      value: value,
      timestamp: DateTime.now(),
    );
    await _repository.addScan(scan);
    state = _repository.getHistory();
  }

  Future<void> removeScan(int index) async {
    await _repository.removeScan(index);
    state = _repository.getHistory();
  }

  Future<void> clearAll() async {
    await _repository.clearHistory();
    state = [];
  }
}
