import 'package:equatable/equatable.dart';

import 'location_entity.dart';

class AddressEntity extends Equatable {
  final String cep;
  final String state;
  final String city;
  final String neighborhood;
  final String street;
  final String service;
  final String complement;
  final String number;
  final LocationEntity location;

  const AddressEntity({
    required this.cep,
    required this.state,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.service,
    required this.complement,
    required this.number,
    required this.location,
  });

  AddressEntity copyWith({
    String? cep,
    String? state,
    String? city,
    String? neighborhood,
    String? street,
    String? service,
    String? complement,
    String? number,
    LocationEntity? location,
  }) {
    return AddressEntity(
      cep: cep ?? this.cep,
      state: state ?? this.state,
      city: city ?? this.city,
      neighborhood: neighborhood ?? this.neighborhood,
      street: street ?? this.street,
      service: service ?? this.service,
      complement: complement ?? this.complement,
      number: number ?? this.number,
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [
        cep,
        state,
        city,
        neighborhood,
        street,
        service,
        complement,
        number,
        location,
      ];
}
