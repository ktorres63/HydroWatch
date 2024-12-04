class Node {
  final int nodeId;
  final String name;
  final String status;

  Node({required this.nodeId, required this.name, required this.status});

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      nodeId: json['node_id'],
      name: json['name'],
      status: json['status'],
    );
  }
}
