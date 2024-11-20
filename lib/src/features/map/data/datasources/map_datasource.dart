import '../../../../core/shared/data/models/address_model.dart';

abstract class MapDatasource {
  Future<AddressModel> getAddressBrazilByCep(String cep);
}
