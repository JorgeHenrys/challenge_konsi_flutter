part of 'map_cubit.dart';

enum MapSearchStatus { idle, error, loading, success }

class MapState extends Equatable {
  final String searchText;
  final List<AddressEntity> addressList;
  final MapSearchStatus searchStatus;
  final AddressEntity selectedAddress;

  const MapState({
    required this.searchText,
    required this.addressList,
    required this.searchStatus,
    required this.selectedAddress,
  });

  factory MapState.initial() => const MapState(
        searchText: '',
        addressList: [],
        searchStatus: MapSearchStatus.idle,
        selectedAddress: AddressEntity(
          cep: '',
          state: '',
          city: '',
          neighborhood: '',
          street: '',
          service: '',
          complement: '',
          number: '',
          location: LocationEntity(
            type: '',
            coordinates: CoordinatesEntity(
              longitude: '',
              latitude: '',
            ),
          ),
        ),
      );

  MapState copyWith({
    String? searchText,
    List<AddressEntity>? addressList,
    MapSearchStatus? searchStatus,
    AddressEntity? selectedAddress,
  }) {
    return MapState(
      searchText: searchText ?? this.searchText,
      addressList: addressList ?? this.addressList,
      searchStatus: searchStatus ?? this.searchStatus,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }

  @override
  List<Object?> get props => [
        searchText,
        addressList,
        searchStatus,
        selectedAddress,
      ];
}
