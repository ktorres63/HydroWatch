import 'package:flutter/material.dart';
import 'package:hydro_watch/models/node.dart';
import 'package:hydro_watch/service/api_service.dart';

class GeneralCard extends StatelessWidget {
  final SensorData node;

  const GeneralCard({required this.node, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              node.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Ubicación: ${node.location}",
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 8),
            Text(
              "Latitud: ${node.coordinates['lat']}",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Text(
              "Longitud: ${node.coordinates['log']}",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
