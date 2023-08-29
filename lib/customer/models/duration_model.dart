class DurationModel {
  final int id, duration;
  final String name;
  DurationModel({
    required this.id,
    required this.name,
    required this.duration,
  });
  factory DurationModel.fromJson(Map<String, dynamic> json) => DurationModel(
        id: json['id'],
        name: json['name'],
        duration: json['duration'],
      );
}
