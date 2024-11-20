import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../map.dart';

class MapRepositoryImpl implements MapRepository {
  final MapDatasource _remoteDatasource;

  MapRepositoryImpl({required MapDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, AddressEntity>> getAddressBrazilByCep(
      String cep) async {
    try {
      final result = await _remoteDatasource.getAddressBrazilByCep(cep);
      final items = AddressMapper.toEntity(result);

      return Right(items);
    } on ServerException catch (err) {
      return Left(ServerFailure(err.message));
    } catch (err) {
      return Left(UnknownFailure(message: err.toString()));
    }
  }
}
