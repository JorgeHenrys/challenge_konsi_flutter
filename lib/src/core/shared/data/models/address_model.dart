import 'package:equatable/equatable.dart';

import 'location_model.dart';

class AddressModel extends Equatable {
  final String cep;
  final String state;
  final String city;
  final String neighborhood;
  final String street;
  final String service;
  final String complement;
  final String number;
  final LocationModel location;

  const AddressModel({
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

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: json['cep'] ?? '',
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      neighborhood: json['neighborhood'] ?? '',
      street: json['street'] ?? '',
      service: json['service'] ?? '',
      complement: json['complement'] ?? '',
      number: json['number'] ?? '',
      location: LocationModel.fromJson(
        json['location'] ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'state': state,
      'city': city,
      'neighborhood': neighborhood,
      'street': street,
      'service': service,
      'complement': complement,
      'number': number,
      'location': location.toJson(),
    };
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
