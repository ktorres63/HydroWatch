import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final List<Map<String, dynamic>> sensors = [
    {
      'name': 'Luz',
      'value': '80%',
      'icon': Icons.wb_sunny,
    },
    {
      'name': 'Humedad del suelo',
      'value': '40%',
      'icon': Icons.grass,
    },
    {
      'name': 'Temperatura',
      'value': '25°C',
      'icon': Icons.thermostat,
    },
    {
      'name': 'Nivel de agua',
      'value': '60%',
      'icon': Icons.water,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView.builder(
        itemCount: sensors.length,
        itemBuilder: (context, index) {
          final sensor = sensors[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(sensor['icon'], size: 40, color: Colors.blue),
              title: Text(
                sensor['name'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Valor: ${sensor['value']}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.blue),
              onTap: () {
                // Acción al tocar el sensor (puedes redirigir a una página de detalles o mostrar más información)
                print('${sensor['name']} seleccionado');
              },
            ),
          );
        },
      ),
    );
  }
}
