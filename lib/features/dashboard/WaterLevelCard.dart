import 'package:flutter/material.dart';
import 'package:hydro_watch/service/api_service.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WaterLevelCard extends StatelessWidget {
  final WaterVolume waterVolume;
  final double maxVolume; // Valor máximo configurable

  const WaterLevelCard({
    required this.waterVolume,
    this.maxVolume = 100.0, // Valor predeterminado para el máximo
    Key? key,
  }) : super(key: key);

  double calculatePercentage(double currentVolume) {
    return (currentVolume / maxVolume).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    double percentage = calculatePercentage(waterVolume.volume);

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Nivel de Agua",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 12.0,
              percent: percentage,
              center: Text(
                "${(percentage * 100).toStringAsFixed(1)}%",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              progressColor: Colors.blue,
              backgroundColor: Colors.grey[300]!,
            ),
            SizedBox(height: 16),
            Text(
              "${waterVolume.volume.toStringAsFixed(2)} / ${maxVolume.toStringAsFixed(2)} Litros",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[300],
              color: percentage > 0.75 ? Colors.blue : (percentage > 0.5 ? Colors.green : Colors.orange),
              minHeight: 10,
            ),
            SizedBox(height: 16),
            Text(
              "Nota: El nivel máximo del tanque está configurado en ${maxVolume.toStringAsFixed(2)} litros.",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
