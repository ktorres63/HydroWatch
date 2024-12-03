import 'package:flutter/material.dart';
import 'package:hydro_watch/service/api_service.dart';

class TestApiService extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test ApiService'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    final sensors = await apiService.getSensors();
                    print('Sensor data:');
                    for (var sensor in sensors) {
                      print(sensor.toJson());
                    }
                  } catch (e) {
                    print('Error fetching sensor data: $e');
                  }
                },
                child: Text('Fetch Sensors Once'),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    apiService.getSensorsRealTime().listen((sensors) {
                      print('Real-time sensor data:');
                      for (var sensor in sensors) {
                        print(sensor.toJson());
                      }
                    });
                  } catch (e) {
                    print('Error fetching real-time data: $e');
                  }
                },
                child: Text('Fetch Sensors Real-Time'),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final waterVolume = await apiService.getWaterVolume();
                    print('Water volume: $waterVolume');
                    print(waterVolume.volume);
                  } catch (e) {
                    print('Error fetching water volume: $e');
                  }
                },
                child: Text('Fetch Water Volume Once'),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    apiService.getWaterVolumeStream().listen((waterVolume) {
                      print('Real-time water volume: $waterVolume');
                      print(waterVolume.volume);
                    });
                  } catch (e) {
                    print('Error fetching real-time water volume: $e');
                  }
                },
                child: Text('Fetch Water Volume Real-Time'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}