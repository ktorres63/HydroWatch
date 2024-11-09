import 'package:flutter/material.dart';

import 'widgets/simple_card.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tarjeta que ocupa todo el ancho
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.water_drop, size: 40, color: Colors.blue),
                    SizedBox(width: 10), // Espacio entre icono y texto
                    const Expanded(
                      child: Text(
                        'Riego Automático',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Switch(
                      value: true, // Valor inicial
                      onChanged: (value) {
                        // Aquí puedes manejar el cambio de estado del Switch
                      },
                    ),
                    Icon(Icons.info, color: Colors.blue),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), // Espacio entre la tarjeta grande y el GridView

            // Cuadrícula de tarjetas pequeñas
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: const [
                  CustomCard(
                    title: 'Luz',
                    icon: Icons.wb_sunny,
                    subtitle: '80%',
                  ),
                  CustomCard(
                    title: 'Humedad del suelo',
                    icon: Icons.grass,
                    subtitle: '40%',
                  ),
                  CustomCard(
                    title: 'Temperatura',
                    icon: Icons.thermostat,
                    subtitle: '25°C',
                  ),
                  CustomCard(
                    title: 'Nivel de agua',
                    icon: Icons.water,
                    subtitle: '60%',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
