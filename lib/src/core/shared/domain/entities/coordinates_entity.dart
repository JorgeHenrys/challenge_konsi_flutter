import 'package:equatable/equatable.dart';

class CoordinatesEntity extends Equatable {
  final String longitude;
  final String latitude;

  const CoordinatesEntity({
    required this.longitude,
    required this.latitude,
  });

  CoordinatesEntity copyWith({
    String? longitude,
    String? latitude,
  }) {
    return CoordinatesEntity(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  @override
  List<Object?> get props => [
        longitude,
        latitude,
      ];
}
