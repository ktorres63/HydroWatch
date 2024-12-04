import 'package:flutter/material.dart';
import 'package:hydro_watch/service/api_service.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WaterLevelCard extends StatelessWidget {
  final WaterVolume waterVolume;
  final double maxVolume; // Valor máximo configurable
  final List<double> thresholds; // Puntos de corte
  final List<Color> colors; // Colores asociados a los puntos de corte

  const WaterLevelCard({
    required this.waterVolume,
    this.maxVolume = 100.0, // Valor predeterminado para el máximo
    this.thresholds = const [0.5, 0.75], // Valores por defecto
    this.colors = const [Colors.orange, Colors.green, Colors.blue], // Colores por defecto
    Key? key,
  }) : super(key: key);

  double calculatePercentage(double currentVolume) {
    return (currentVolume / maxVolume).clamp(0.0, 1.0);
  }

  Color determineColor(double percentage) {
    for (int i = 0; i < thresholds.length; i++) {
      if (percentage <= thresholds[i]) {
        return colors[i];
      }
    }
    return colors.last;
  }

  @override
  Widget build(BuildContext context) {
    double percentage = calculatePercentage(waterVolume.volume);
    Color progressColor = determineColor(percentage);

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.water_drop,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                Text(
                  "Nivel de Agua",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  color: Colors.grey,
                  size: 24,
                ),
              ],
            ),
            SizedBox(height: 16),
            CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 15.0,
              percent: percentage,
              animation: true,
              animationDuration: 1000,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${(percentage * 100).toStringAsFixed(1)}%",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "${waterVolume.volume.toStringAsFixed(2)} L",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              progressColor: progressColor,
              backgroundColor: Colors.grey[300]!,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Capacidad Máxima",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${maxVolume.toStringAsFixed(2)} Litros",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Estado",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      percentage > thresholds.last
                          ? "Lleno"
                          : percentage > thresholds.first
                          ? "Adecuado"
                          : "Bajo",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: progressColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[300],
              color: progressColor,
              minHeight: 12,
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
