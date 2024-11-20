import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import 'map_datasource.dart';

class MapRemoteDatasource implements MapDatasource {
  final Dio client;
  static const String _baseUrl = "https://brasilapi.com.br";

  MapRemoteDatasource(this.client) : super();

  @override
  Future<AddressModel> getAddressBrazilByCep(String cep) async {
    try {
      final response = await client.get('$_baseUrl/api/cep/v2/$cep');
      if (response.statusCode == 200) {
        return AddressModel.fromJson(response.data);
      } else {
        throw Exception('Erro ao buscar CEP');
      }
    } catch (e) {
      throw Exception('Erro ao buscar CEP: $e');
    }
  }
}
