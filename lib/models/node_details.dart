class NodeDetails {
  final String sectorName;
  final String cropType;
  final String location;

  NodeDetails({required this.sectorName, required this.cropType, required this.location});

  factory NodeDetails.fromJson(Map<String, dynamic> json) {
    return NodeDetails(
      sectorName: json['sector_name'],
      cropType: json['crop_type'],
      location: json['location'],
    );
  }
}
