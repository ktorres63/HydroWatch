import 'package:flutter/material.dart';

class SensorDetailPage extends StatelessWidget {
  final String sensorName;
  final String sensorValue;
  final IconData sensorIcon;

  SensorDetailPage({required this.sensorName, required this.sensorValue, required this.sensorIcon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$sensorName - Detalles'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(sensorIcon, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              sensorName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Valor actual: $sensorValue',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
            // Aquí puedes agregar más detalles o gráficas según sea necesario
          ],
        ),
      ),
    );
  }
}
