class BirdClassification {
  final String statusCode;
  final String statusName;
  final String commonName;
  final String scientificName;
  final String birdDescription;

  BirdClassification({
    required this.statusCode,
    required this.commonName,
    required this.statusName,
    required this.scientificName,
    required this.birdDescription,
  });
  factory BirdClassification.fromJson(Map<String, dynamic> json) {
    return BirdClassification(
      statusCode: json['status_code'],
      commonName: json['common_name'],
      statusName: json['status_name'],
      scientificName: json['scientific_name'],
      birdDescription: json['birds_description'],
    );
  }
}
