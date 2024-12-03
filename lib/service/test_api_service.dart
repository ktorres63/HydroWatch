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
                    print('Water volume: ${waterVolume.volume}');
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
                      print('Real-time water volume: ${waterVolume.volume}');
                    });
                  } catch (e) {
                    print('Error fetching real-time water volume: $e');
                  }
                },
                child: Text('Fetch Water Volume Real-Time'),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final node = await apiService.getNode(1);
                    print('Node 1 data: ${node.toJson()}');
                  } catch (e) {
                    print('Error fetching node 1 data: $e');
                  }
                },
                child: Text('Fetch Node 1 Once'),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    apiService.getNodeRealTime(1).listen((node) {
                      print('Real-time Node 1 data: ${node.toJson()}');
                    });
                  } catch (e) {
                    print('Error fetching real-time node 1 data: $e');
                  }
                },
                child: Text('Fetch Node 1 Real-Time'),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final node = await apiService.getNode(2);
                    print('Node 2 data: ${node.toJson()}');
                  } catch (e) {
                    print('Error fetching node 2 data: $e');
                  }
                },
                child: Text('Fetch Node 2 Once'),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    apiService.getNodeRealTime(2).listen((node) {
                      print('Real-time Node 2 data: ${node.toJson()}');
                    });
                  } catch (e) {
                    print('Error fetching real-time node 2 data: $e');
                  }
                },
                child: Text('Fetch Node 2 Real-Time'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
