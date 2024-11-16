import 'package:flutter/material.dart';
import 'dart:math';
import 'sensor_detail_page.dart';  // Importa la nueva página

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isAutomaticWateringOn = false;
  final Random random = Random();

  // Valores iniciales para los sensores
  double lightLevel = 80.0;
  double soilMoisture = 40.0;
  double temperature = 25.0;
  double waterLevel = 60.0;

  void toggleAutomaticWatering(bool value) {
    setState(() {
      isAutomaticWateringOn = value;
    });
  }

  // Función para simular cambios aleatorios en los valores de los sensores
  void updateSensorValues() {
    setState(() {
      lightLevel = random.nextDouble() * 100;
      soilMoisture = random.nextDouble() * 100;
      temperature = 15 + random.nextDouble() * 20; // Rango de temperatura de 15°C a 35°C
      waterLevel = random.nextDouble() * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección de Riego Automático con interruptor
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.water_drop, color: Colors.blue),
                      SizedBox(width: 10),
                      Text('Riego Automático', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: isAutomaticWateringOn,
                        onChanged: toggleAutomaticWatering,
                      ),
                      Icon(Icons.info_outline, color: Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Lista de sensores
            Expanded(
              child: ListView(
                children: [
                  _buildSensorListTile(
                    name: 'Luz',
                    value: '${lightLevel.toStringAsFixed(1)}%',
                    icon: Icons.wb_sunny,
                    onTap: () => _navigateToDetailPage(context, 'Luz', '${lightLevel.toStringAsFixed(1)}%', Icons.wb_sunny),
                  ),
                  _buildSensorListTile(
                    name: 'Humedad del Suelo',
                    value: '${soilMoisture.toStringAsFixed(1)}%',
                    icon: Icons.grass,
                    onTap: () => _navigateToDetailPage(context, 'Humedad del Suelo', '${soilMoisture.toStringAsFixed(1)}%', Icons.grass),
                  ),
                  _buildSensorListTile(
                    name: 'Temperatura',
                    value: '${temperature.toStringAsFixed(1)}°C',
                    icon: Icons.thermostat,
                    onTap: () => _navigateToDetailPage(context, 'Temperatura', '${temperature.toStringAsFixed(1)}°C', Icons.thermostat),
                  ),
                  _buildSensorListTile(
                    name: 'Nivel de Agua',
                    value: '${waterLevel.toStringAsFixed(1)}%',
                    icon: Icons.water,
                    onTap: () => _navigateToDetailPage(context, 'Nivel de Agua', '${waterLevel.toStringAsFixed(1)}%', Icons.water),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para navegar a la página de detalles del sensor
  void _navigateToDetailPage(BuildContext context, String sensorName, String sensorValue, IconData sensorIcon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SensorDetailPage(
          sensorName: sensorName,
          sensorValue: sensorValue,
          sensorIcon: sensorIcon,
        ),
      ),
    );
  }

  // Widget para cada elemento de la lista de sensores
  Widget _buildSensorListTile({required String name, required String value, required IconData icon, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(name, style: TextStyle(fontSize: 18)),
      subtitle: Text(value, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
      onTap: onTap,
    );
  }
}
