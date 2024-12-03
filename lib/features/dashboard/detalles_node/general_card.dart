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
            Row(
              children: [
                Icon(
                  Icons.sensors,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    node.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 16, color: Colors.grey.shade300),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.redAccent),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Ubicación: ${node.location}",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.map, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  "Latitud: ${node.coordinates['lat']}",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.map, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  "Longitud: ${node.coordinates['log']}",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            // SizedBox(height: 16),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: ElevatedButton.icon(
            //     onPressed: () {
            //       // Acción al presionar el botón
            //     },
            //     icon: Icon(Icons.info_outline),
            //     label: Text("Más detalles"),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blueAccent,
            //       foregroundColor: Colors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}