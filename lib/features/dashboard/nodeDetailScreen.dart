import 'package:flutter/material.dart';
import 'package:hydro_watch/service/api_service.dart';
import 'package:hydro_watch/models/node.dart';
import 'package:hydro_watch/features/common/error_display.dart';
import 'dart:async';

class NodeDetail extends StatelessWidget {
  final int nodeId;
  final ApiService apiService = ApiService();

  NodeDetail({required this.nodeId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Nodo $nodeId'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<SensorData>(
        future: apiService.getNodeRealTime(nodeId).first.timeout(
          Duration(seconds: 10),
          onTimeout: () => throw TimeoutException("Tiempo de espera agotado"),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.teal),
            );
          } else if (snapshot.hasError) {
            return ErrorDisplay(
              title: "Error al cargar el nodo",
              message: snapshot.error is TimeoutException
                  ? "El tiempo de espera se agotó. Intenta nuevamente."
                  : "No se pudo cargar la información del nodo. Intenta nuevamente.",
              onRetry: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => NodeDetail(nodeId: nodeId),
                  ),
                );
              },
            );
          } else if (!snapshot.hasData) {
            return ErrorDisplay(
              title: "Nodo no encontrado",
              message: "No hay información disponible para este nodo.",
              onRetry: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => NodeDetail(nodeId: nodeId),
                  ),
                );
              },
            );
          }

          final node = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          node.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.lightbulb,
                          size: 48,
                          color: node.foto != null && node.foto! > 50
                              ? Colors.yellow
                              : Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Ubicación: ${node.location}",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Latitud: ${node.coordinates['lat']}",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      "Longitud: ${node.coordinates['log']}",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Humedad del suelo:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${node.pot ?? 0}%",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
