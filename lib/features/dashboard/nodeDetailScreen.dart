import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hydro_watch/features/dashboard/detalles_node/general_card.dart';
import 'package:hydro_watch/features/dashboard/detalles_node/humidity_card.dart';
import 'package:hydro_watch/features/dashboard/detalles_node/light_card.dart';
import 'package:hydro_watch/service/api_service.dart';
import 'package:hydro_watch/models/node.dart';
import 'package:hydro_watch/features/common/error_display.dart';

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
      body: StreamBuilder<SensorData>(
        stream: apiService.getNodeRealTime(nodeId).handleError(
              (error) => throw TimeoutException("Tiempo de espera agotado"),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GeneralCard(node: node),
                  SizedBox(height: 16),
                  HumidityCard(node: node),
                  SizedBox(height: 16),
                  LightCard(node: node),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}