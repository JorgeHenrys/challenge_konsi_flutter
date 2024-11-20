import 'package:equatable/equatable.dart';

class CoordinatesModel extends Equatable {
  final String longitude;
  final String latitude;

  const CoordinatesModel({
    required this.longitude,
    required this.latitude,
  });

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      longitude: json['longitude'] ?? '',
      latitude: json['latitude'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  @override
  List<Object?> get props => [
        longitude,
        latitude,
      ];
}
