import 'package:flutter/material.dart';
import 'package:hydro_watch/models/node.dart';
import 'package:hydro_watch/service/api_service.dart';

class LightCard extends StatelessWidget {
  final SensorData node;

  const LightCard({required this.node, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String interpretLight(int? light) {
      if (light == null) return "Sin datos disponibles.";
      double percentage = (light / 1023) * 100;
      if (percentage < 25) return "Muy baja iluminación (Oscuridad).";
      if (percentage < 50) return "Iluminación baja (Condiciones de sombra).";
      if (percentage < 75) return "Iluminación moderada (Luz ambiental adecuada).";
      return "Alta iluminación (Luz brillante o directa).";
    }

    Color determineColor(int? light) {
      if (light == null) return Colors.grey;
      double percentage = (light / 1023) * 100;
      if (percentage < 25) return Colors.blueGrey;
      if (percentage < 50) return Colors.amber;
      if (percentage < 75) return Colors.yellow;
      return Colors.orange;
    }

    double calculatePercentage(int? light) {
      if (light == null) return 0.0;
      return (light / 1023) * 100;
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
              "Nivel de Iluminación",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text(
                    "${calculatePercentage(node.foto).toStringAsFixed(1)}%",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: determineColor(node.foto),
                    ),
                  ),
                  Text(
                    "(${node.foto ?? 0})",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: determineColor(node.foto),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              interpretLight(node.foto),
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: calculatePercentage(node.foto) / 100,
              backgroundColor: Colors.grey[300],
              color: determineColor(node.foto),
              minHeight: 10,
            ),
            SizedBox(height: 16),
            Text(
              "Nota: Los valores van de 0 (oscuro) a 1023 (máxima iluminación).",
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