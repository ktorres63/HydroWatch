class Statistics {
  final int humidity;
  final int lightLevel;
  final List<int> humidityHistory;
  final List<int> lightHistory;

  Statistics({
    required this.humidity,
    required this.lightLevel,
    required this.humidityHistory,
    required this.lightHistory,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      humidity: json['humidity'],
      lightLevel: json['light_level'],
      humidityHistory: List<int>.from(json['statistics']['humidity_history']),
      lightHistory: List<int>.from(json['statistics']['light_history']),
    );
  }
}
