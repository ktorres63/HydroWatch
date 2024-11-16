import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hydro_watch/models/node.dart';
import 'package:hydro_watch/models/node_details.dart';
import 'package:hydro_watch/models/statistics.dart';

class ApiService {
  final String baseUrl = "https://apimocha.com/hydrowatch/api";

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
}
