import '../../../core.dart';

abstract class CoordinatesMapper {
  static CoordinatesEntity toEntity(CoordinatesModel model) {
    return CoordinatesEntity(
      longitude: model.longitude,
      latitude: model.latitude,
    );
  }

  static CoordinatesModel toModel(CoordinatesEntity entity) {
    return CoordinatesModel(
      longitude: entity.longitude,
      latitude: entity.latitude,
    );
  }
}
