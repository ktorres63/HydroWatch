// import 'package:flutter/material.dart';
// import 'package:hydro_watch/models/node_details.dart';
// import 'package:hydro_watch/models/statistics.dart';
// import 'package:hydro_watch/service/api_service.dart';
//
//
// class NodeDetailScreen extends StatelessWidget {
//   final int nodeId;
//   final ApiService apiService = ApiService();
//
//   NodeDetailScreen({required this.nodeId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Detalles del Nodo")),
//       body: FutureBuilder(
//         future: Future.wait([
//           apiService.getNodeDetails(nodeId),
//           apiService.getNodeStatistics(nodeId),
//         ]),
//         builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//
//           final nodeDetails = snapshot.data![0] as NodeDetails;
//           final statistics = snapshot.data![1] as Statistics;
//
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Cultivo: ${nodeDetails.cropType}", style: TextStyle(fontSize: 18)),
//                 Text("Ubicación: ${nodeDetails.location}", style: TextStyle(fontSize: 16)),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Humedad: ${statistics.humidity}%", style: TextStyle(fontSize: 16)),
//                     Text("Luz: ${statistics.lightLevel} lx", style: TextStyle(fontSize: 16)),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Text("Estadísticas", style: TextStyle(fontSize: 18)),
//                 // Aquí puedes agregar un gráfico usando `charts_flutter`.
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
