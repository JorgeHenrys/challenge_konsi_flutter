import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/core.dart';
import '../../map.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final MapRepository _mapRepository;
  MapCubit({required MapRepository mapRepository})
      : _mapRepository = mapRepository,
        super(MapState.initial());

  String truncateWithEllipsis(String text, int maxChars) {
    return text.length <= maxChars ? text : '${text.substring(0, maxChars)}...';
  }

  FutureOr<void> changeSearchText(String value) async {
    emit(state.copyWith(searchText: value));

    await fetchManyZipCodes(value);
  }

  FutureOr<void> setSelectedAddress() async {
    if (state.addressList.isNotEmpty) {
      emit(
        state.copyWith(
          selectedAddress: state.addressList[0],
          searchStatus: MapSearchStatus.success,
        ),
      );
    }
  }

  FutureOr<void> closeBottomSheet() async {
    emit(
      state.copyWith(
        searchStatus: MapSearchStatus.idle,
        addressList: [],
        searchText: '',
      ),
    );
  }

  FutureOr<void> searchAddressByZipCode(String zipCode) async {
    final result = await _mapRepository.getAddressBrazilByCep(zipCode);

    result.fold(
      (failed) {
        debugPrint(failed.message);
      },
      (response) {
        List<AddressEntity> addresses = List.from(state.addressList);

        addresses.add(response);

        emit(state.copyWith(addressList: addresses));
      },
    );
  }

  FutureOr<void> fetchManyZipCodes(String code) async {
    emit(state.copyWith(addressList: []));

    if (code.length == 8) {
      await searchAddressByZipCode(code);
    }
  }

  Future<void> saveAddressAtList(AddressEntity address) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    AddressModel addressModel = AddressMapper.toModel(address);

    final addressList = await getAddressToList();

    addressList.add(addressModel);

    List<String> jsonList =
        addressList.map((a) => json.encode(a.toJson())).toList();

    await prefs.setStringList("addressStorageList", jsonList);
  }

  Future<List<AddressModel>> getAddressToList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList("addressStorageList");

    if (jsonList == null) {
      return [];
    }

    return jsonList
        .map((jsonString) => AddressModel.fromJson(json.decode(jsonString)))
        .toList();
  }
}
