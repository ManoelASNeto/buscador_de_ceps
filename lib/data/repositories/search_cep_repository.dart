import 'package:buscador_de_ceps/core/erros/exceptions.dart';
import 'package:buscador_de_ceps/core/erros/failures.dart';
import 'package:buscador_de_ceps/data/datasource/search_cep_remote_datasource.dart';
import 'package:buscador_de_ceps/domain/entity/search_cep_entity.dart';
import 'package:buscador_de_ceps/domain/repositories/i_search_cep_repository.dart';
import 'package:dartz/dartz.dart';

class SearchCepRepository implements ISearchCepRepository {
  final ISearchCepRemoteDataSource remoteDataSource;

  SearchCepRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, SearchCepEntity>> getSearchCep(String search) async {
    try {
      var cep = await remoteDataSource.searchCepModel(search);
      final entity = cep.toEntity();
      return Right(entity);
    } on ServerException {
      throw Left(ServerFailure());
    }
  }
}
