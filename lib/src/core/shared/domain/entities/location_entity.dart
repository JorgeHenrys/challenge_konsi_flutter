import 'package:equatable/equatable.dart';

import 'coordinates_entity.dart';

class LocationEntity extends Equatable {
  final String type;
  final CoordinatesEntity coordinates;

  const LocationEntity({
    required this.type,
    required this.coordinates,
  });

  LocationEntity copyWith({
    String? type,
    CoordinatesEntity? coordinates,
  }) {
    return LocationEntity(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  @override
  List<Object?> get props => [
        type,
        coordinates,
      ];
}
