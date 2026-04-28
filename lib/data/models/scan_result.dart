import 'package:hive/hive.dart';

part 'scan_result.g.dart';

@HiveType(typeId: 0)
class ScanResult extends HiveObject {
  @HiveField(0)
  final String value;

  @HiveField(1)
  final DateTime timestamp;

  ScanResult({
    required this.value,
    required this.timestamp,
  });

  bool get isUrl {
    return Uri.tryParse(value)?.hasAbsolutePath ?? false;
  }
}
