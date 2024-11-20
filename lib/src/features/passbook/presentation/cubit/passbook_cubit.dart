import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/core.dart';

part 'passbook_state.dart';

class PassbookCubit extends Cubit<PassbookState> {
  PassbookCubit() : super(PassbookState.initial());

  String truncateWithEllipsis(String text, int maxChars) {
    return text.length <= maxChars ? text : '${text.substring(0, maxChars)}...';
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

  void initialize() async {
    List<AddressEntity> addressEntities = [];
    final addressList = await getAddressToList();

    addressEntities =
        addressList.map((e) => AddressMapper.toEntity(e)).toList();

    emit(state.copyWith(addressList: addressEntities));
  }
}
