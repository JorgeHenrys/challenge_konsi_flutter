import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

abstract class MapRepository {
  Future<Either<Failure, AddressEntity>> getAddressBrazilByCep(String cep);
}
