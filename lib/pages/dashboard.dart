import 'package:flutter/material.dart';
import 'dart:math';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isAutomaticWateringOn = false;
  final Random random = Random();

  // Initial values for sensors
  double lightLevel = 80.0;
  double soilMoisture = 40.0;
  double temperature = 25.0;
  double waterLevel = 60.0;

  void toggleAutomaticWatering(bool value) {
    setState(() {
      isAutomaticWateringOn = value;
    });
  }

  // Function to simulate random changes in sensor data
  void updateSensorValues() {
    setState(() {
      lightLevel = random.nextDouble() * 100;
      soilMoisture = random.nextDouble() * 100;
      temperature = 15 + random.nextDouble() * 20; // Temperature range from 15°C to 35°C
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
            // Automatic Watering section with toggle switch
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
            // Grid of sensor data with tap functionality
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildSensorCard(
                    icon: Icons.wb_sunny,
                    label: 'Luz',
                    value: '${lightLevel.toStringAsFixed(1)}%',
                    onTap: updateSensorValues,
                  ),
                  _buildSensorCard(
                    icon: Icons.grass,
                    label: 'Humedad del suelo',
                    value: '${soilMoisture.toStringAsFixed(1)}%',
                    onTap: updateSensorValues,
                  ),
                  _buildSensorCard(
                    icon: Icons.thermostat,
                    label: 'Temperatura',
                    value: '${temperature.toStringAsFixed(1)}°C',
                    onTap: updateSensorValues,
                  ),
                  _buildSensorCard(
                    icon: Icons.water,
                    label: 'Nivel de agua',
                    value: '${waterLevel.toStringAsFixed(1)}%',
                    onTap: updateSensorValues,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for each sensor card with tap functionality
  Widget _buildSensorCard({required IconData icon, required String label, required String value, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(value, style: TextStyle(fontSize: 18, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
