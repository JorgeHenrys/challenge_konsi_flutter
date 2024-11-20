import '../../../core.dart';

abstract class AddressMapper {
  static AddressEntity toEntity(AddressModel model) {
    return AddressEntity(
      cep: model.cep,
      city: model.city,
      state: model.state,
      neighborhood: model.neighborhood,
      street: model.street,
      service: model.service,
      complement: model.complement,
      number: model.number,
      location: LocationMapper.toEntity(model.location),
    );
  }

  static AddressModel toModel(AddressEntity entity) {
    return AddressModel(
      cep: entity.cep,
      city: entity.city,
      state: entity.state,
      neighborhood: entity.neighborhood,
      street: entity.street,
      service: entity.service,
      complement: entity.complement,
      number: entity.number,
      location: LocationMapper.toModel(entity.location),
    );
  }
}
