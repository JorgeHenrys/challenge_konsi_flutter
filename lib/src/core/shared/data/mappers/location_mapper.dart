import '../../../core.dart';

abstract class LocationMapper {
  static LocationEntity toEntity(LocationModel model) {
    return LocationEntity(
      type: model.type,
      coordinates: CoordinatesMapper.toEntity(model.coordinates),
    );
  }

  static LocationModel toModel(LocationEntity entity) {
    return LocationModel(
      type: entity.type,
      coordinates: CoordinatesMapper.toModel(entity.coordinates),
    );
  }
}
