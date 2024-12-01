import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hydro_watch/models/node.dart';
import 'package:hydro_watch/models/node_details.dart';
import 'package:hydro_watch/models/statistics.dart';
import 'package:firebase_database/firebase_database.dart';

class SensorData {
  final int potentiometer1;
  final int potentiometer2;
  final double waterVolume;

  SensorData({
    required this.potentiometer1,
    required this.potentiometer2,
    required this.waterVolume,
  });

  // Constructor para convertir desde un mapa de Firebase
  factory SensorData.fromFirebase(Map<dynamic, dynamic> data) {
    return SensorData(
      potentiometer1: data['Potentiometer1'] ?? 0,
      potentiometer2: data['Potentiometer2'] ?? 0,
      waterVolume: (data['WaterVolume'] ?? 0.0).toDouble(),
    );
  }

  // Método para convertir a un mapa 
  Map<String, dynamic> toJson() {
    return {
      'Potentiometer1': potentiometer1,
      'Potentiometer2': potentiometer2,
      'WaterVolume': waterVolume,
    };
  }
}


class ApiService {
  final String baseUrl = "https://apimocha.com/hydrowatch/api";
  final DatabaseReference _firebaseDatabase = FirebaseDatabase.instance.ref();


  Future<List<Node>> getNodes() async {
    final response = await http.get(Uri.parse('$baseUrl/nodes/'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Node.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load nodes');
    }
  }

  Future<NodeDetails> getNodeDetails(int nodeId) async {
    final response = await http.get(Uri.parse('$baseUrl/nodes/$nodeId/details'));
    if (response.statusCode == 200) {
      return NodeDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load node details');
    }
  }

  Future<Statistics> getNodeStatistics(int nodeId) async {
    final response = await http.get(Uri.parse('$baseUrl/nodes/$nodeId'));
    if (response.statusCode == 200) {
      return Statistics.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load statistics');
    }
  }

  Stream<SensorData> getSensorsRealTime() {
    return _firebaseDatabase.child('sensors').onValue.map((event) {
      if (event.snapshot.value == null) {
        throw Exception('No sensor data found');
      }
      
      // Convierte los datos de Firebase a SensorData
      return SensorData.fromFirebase(
        event.snapshot.value as Map<dynamic, dynamic>
      );
    });
  }
  // Método para obtener datos de sensores una vez
  Future<SensorData> getSensors() async {
    final snapshot = await _firebaseDatabase.child('sensors').get();
    
    if (snapshot.exists) {
      return SensorData.fromFirebase(
        snapshot.value as Map<dynamic, dynamic>
      );
    } else {
      throw Exception('No sensor data found');
    }
  }

  //método para obtener el volumen de agua
  Stream<double> getWaterVolumeStream() {
    final DatabaseReference database = FirebaseDatabase.instance.ref();

    return database.child('sensors/waterVolume').onValue.map((event) {
      if (event.snapshot.value != null) {
        return double.tryParse(event.snapshot.value.toString()) ?? 0.0;
      }
      return 0.0;
    });
  }


}
