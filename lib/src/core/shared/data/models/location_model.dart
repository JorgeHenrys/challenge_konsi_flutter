import 'package:equatable/equatable.dart';

import 'coordinates_model.dart';

class LocationModel extends Equatable {
  final String type;
  final CoordinatesModel coordinates;

  const LocationModel({
    required this.type,
    required this.coordinates,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      type: json['type'] ?? '',
      coordinates: CoordinatesModel.fromJson(json['coordinates'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        type,
        coordinates,
      ];
}
