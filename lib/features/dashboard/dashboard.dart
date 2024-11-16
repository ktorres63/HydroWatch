import 'package:flutter/material.dart';
import 'package:hydro_watch/features/dashboard/nodeDetailScreen.dart';
import 'package:hydro_watch/models/node.dart';
import 'package:hydro_watch/service/api_service.dart';


class NodeListScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nodos")),
      body: FutureBuilder<List<Node>>(
        future: apiService.getNodes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No hay nodos disponibles"));
          }

          final nodes = snapshot.data!;
          return ListView.builder(
            itemCount: nodes.length,
            itemBuilder: (context, index) {
              final node = nodes[index];
              return Card(
                child: ListTile(
                  title: Text(node.name),
                  subtitle: Text("Estado: ${node.status}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NodeDetailScreen(nodeId: node.nodeId),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
