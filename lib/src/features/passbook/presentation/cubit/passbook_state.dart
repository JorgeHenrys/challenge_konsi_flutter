part of 'passbook_cubit.dart';

class PassbookState extends Equatable {
  final List<AddressEntity> addressList;

  const PassbookState({
    required this.addressList,
  });

  factory PassbookState.initial() => const PassbookState(
        addressList: [],
      );

  PassbookState copyWith({
    List<AddressEntity>? addressList,
  }) {
    return PassbookState(
      addressList: addressList ?? this.addressList,
    );
  }

  @override
  List<Object?> get props => [
        addressList,
      ];
}
