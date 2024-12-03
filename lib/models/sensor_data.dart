import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class SensorData {
  @HiveField(0)
  final int pot1;

  @HiveField(1)
  final int pot2;

  @HiveField(2)
  final double waterVolume;

  @HiveField(3)
  final String name;

  @HiveField(4)
  final String location;

  @HiveField(5)
  final Map<String, double> coordinates;

  SensorData({
    required this.pot1,
    required this.pot2,
    required this.waterVolume,
    required this.name,
    required this.location,
    required this.coordinates,
  });
}
