import 'package:flutter/material.dart';
import 'package:hydro_watch/service/api_service.dart';

class TankView extends StatefulWidget {
  @override
  _TankViewState createState() => _TankViewState();
}

class _TankViewState extends State<TankView> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nivel de Agua'),
      ),
      body: StreamBuilder<WaterVolume>(
        stream: _apiService.getWaterVolumeStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final waterVolume = snapshot.data?.volume ?? 0.0;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.water_drop,
                  size: 100,
                  color: Colors.blue,
                ),
                SizedBox(height: 20),
                const Text(
                  'Nivel de Agua',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${waterVolume.toStringAsFixed(2)} MiliLitros',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}