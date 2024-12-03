// modelos

import 'package:firebase_database/firebase_database.dart';

class SensorData {
  final int? foto;
  final String name;
  final String location;
  final Map<String, double> coordinates;
  final int? pot;  // Solo un campo 'pot' que tomará el valor de pot1 o pot2

  SensorData({
    required this.foto,
    required this.name,
    required this.location,
    required this.coordinates,
    this.pot,  // Este campo es el que se usará
  });

  // Constructor para convertir desde un mapa
  factory SensorData.fromMap(Map<dynamic, dynamic> data) {
    // Validar pot1 o pot2, solo se tomará uno
    int? pot;
    if (data['pot1'] != null) {
      pot = data['pot1'];
    } else if (data['pot2'] != null) {
      pot = data['pot2'];
    }

    // Verificar si 'loc' o 'log' están presentes para las coordenadas
    Map<String, double> coordinates = {};
    if (data['loc'] != null) {
      coordinates = {
        'lat': (data['loc']['lat'] ?? 0.0).toDouble(),
        'log': (data['loc']['log'] ?? 0.0).toDouble(),
      };
    } else if (data['log'] != null) {
      coordinates = {
        'lat': (data['log']['lat'] ?? 0.0).toDouble(),
        'log': (data['log']['log'] ?? 0.0).toDouble(),
      };
    }

    return SensorData(
      foto: data['foto'] ?? 0,
      name: data['name'] ?? 'NO ESPECIFICA',
      location: data['ubi_name'] ?? 'NO ESPECIFICA',
      // coordinates: data['loc'] != null
      //     ? {
      //   'lat': (data['loc']['lat'] ?? 0.0).toDouble(),
      //   'log': (data['loc']['log'] ?? 0.0).toDouble(),
      // }
      //     : {},
      coordinates: coordinates, // Asignamos las coordenadas verificadas
      pot: pot, // Solo asignamos el valor de pot1 o pot2
    );
  }

  // Método para convertir a un mapa (JSON compatible)
  Map<String, dynamic> toJson() {
    return {
      'foto': foto,
      'name': name,
      'ubi_name': location,
      'loc': coordinates,
      'pot': pot,  // Solo incluimos 'pot'
    };
  }

  // Método para imprimir los datos de la instancia
  void printData() {
    print('SensorData:');
    print('Foto: $foto');
    print('Name: $name');
    print('Location: $location');
    print('Coordinates: $coordinates');
    print('Pot: $pot'); // Solo mostramos 'pot'
  }
}



class WaterVolume {
  final double volume;

  WaterVolume({required this.volume});

  // Constructor para convertir desde un mapa
  factory WaterVolume.fromMap(Map<dynamic, dynamic> data) {
    return WaterVolume(
      volume: (data['waterVolume'] ?? 0.0).toDouble(),
    );
  }

  // Método para convertir a un mapa (JSON compatible)
  Map<String, dynamic> toJson() {
    return {
      'waterVolume': volume,
    };
  }
}


// Servicios

class ApiService {
  final DatabaseReference _firebaseDatabase = FirebaseDatabase.instance.ref();

  // Método para obtener los datos de sensores una vez
  Future<List<SensorData>> getSensors() async {
    final snapshot = await _firebaseDatabase.child('sensors').get();

    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>;
      // final sensorsData = data['sensors'] as Map<dynamic, dynamic>;

      return data.entries.take(2).map((entry) {
        final sensorData = entry.value as Map<dynamic, dynamic>;
        return SensorData.fromMap(sensorData);
      }).toList();
    } else {
      throw Exception('No sensor data found');
    }
  }

  // Método para obtener el volumen de agua global
  Future<WaterVolume> getWaterVolume() async {
    final snapshot = await _firebaseDatabase.child('sensors').get();

    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>;
      // Aquí extraemos el waterVolume del nivel superior (no del sensor individual)
      return WaterVolume.fromMap(data);
    } else {
      throw Exception('No water volume data found');
    }
  }

  // Stream para obtener los datos de sensores en tiempo real
  Stream<List<SensorData>> getSensorsRealTime() {
    return _firebaseDatabase.child('sensors').onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) {
        throw Exception('No sensor data found');
      }

      // final sensorsData = data['sensors'] as Map<dynamic, dynamic>;

      return data.entries.take(2).map((entry) {
        final sensorData = entry.value as Map<dynamic, dynamic>;
        return SensorData.fromMap(sensorData);
      }).toList();
    });
  }

  // Stream para obtener el volumen de agua en tiempo real
  Stream<WaterVolume> getWaterVolumeStream() {
    return _firebaseDatabase.child('sensors').onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null && data.containsKey('waterVolume')) {
        return WaterVolume.fromMap(data);
      }
      return WaterVolume(volume: 0.0);  // Si no se encuentra el volumen, regresamos 0
    });
  }
}
