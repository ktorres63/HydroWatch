import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hydro_watch/features/common/error_display.dart';
import 'package:hydro_watch/features/dashboard/nodeDetailScreen.dart';
import 'package:hydro_watch/models/node.dart';
import 'package:hydro_watch/service/api_service.dart';

class NodeListScreen extends StatefulWidget {
  @override
  _NodeListScreenState createState() => _NodeListScreenState();
}

class _NodeListScreenState extends State<NodeListScreen> {
  final ApiService apiService = ApiService();
  bool _isLoading = true;
  bool _isError = false;
  String _errorMessage = '';
  List<SensorData> _nodes = [];

  @override
  void initState() {
    super.initState();
    _fetchNodes();
  }

  void _fetchNodes() async {
    setState(() {
      _isLoading = true;
      _isError = false;
      _errorMessage = '';
    });

    try {
      final nodes = await apiService.getSensors().timeout(
            Duration(seconds: 10),
            onTimeout: () => throw TimeoutException("Tiempo de espera agotado"),
          );
      setState(() {
        _nodes = nodes;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _isError = true;
        _errorMessage = error is TimeoutException
            ? "El tiempo de espera se agotó. Intenta nuevamente."
            : "Algo salió mal. Por favor verifica tu conexión.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Puntos de Riego",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 2,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(color: Colors.teal),
            )
          : _isError
              ? ErrorDisplay(
                  title: "Algo salió mal",
                  message: _errorMessage,
                  onRetry: _fetchNodes,
                )
              : _nodes.isEmpty
                  ? Center(
                      child: Text(
                        "No hay nodos disponibles",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _nodes.length,
                      itemBuilder: (context, index) {
                        final node = _nodes[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    NodeDetail(nodeId: index + 1),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.teal[50],
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16),
                              title: Text(
                                "${node.name} - ${node.location}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Text(
                                    "Cultivo: ${node.name}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Ubicación: ${node.location}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
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
