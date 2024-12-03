import 'package:flutter/material.dart';
import 'package:hydro_watch/models/node.dart';
import 'package:hydro_watch/service/api_service.dart';

class HumidityCard extends StatelessWidget {
  final SensorData node;

  const HumidityCard({required this.node, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String interpretHumidity(int? humidity) {
      if (humidity == null) return "Sin datos disponibles.";
      double percentage = (humidity / 4095) * 100;
      if (percentage < 25) return "Humedad muy baja (Riesgo de sequía).";
      if (percentage < 50) return "Humedad baja (Puede requerir riego).";
      if (percentage < 75) return "Humedad adecuada.";
      return "Humedad alta (Saturación de agua).";
    }

    Color determineColor(int? humidity) {
      if (humidity == null) return Colors.grey;
      double percentage = (humidity / 4095) * 100;
      if (percentage < 25) return Colors.red;
      if (percentage < 50) return Colors.orange;
      if (percentage < 75) return Colors.green;
      return Colors.blue;
    }

    double calculatePercentage(int? humidity) {
      if (humidity == null) return 0.0;
      return (humidity / 4095) * 100;
    }

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Humedad del Suelo",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                "${calculatePercentage(node.pot).toStringAsFixed(1)}%",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: determineColor(node.pot),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              interpretHumidity(node.pot),
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: calculatePercentage(node.pot) / 100,
              backgroundColor: Colors.grey[300],
              color: determineColor(node.pot),
              minHeight: 10,
            ),
            SizedBox(height: 16),
            Text(
              "Nota: Los valores van de 0 (seco) a 4095 (totalmente húmedo).",
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
