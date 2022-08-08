import 'package:buscador_de_ceps/core/erros/failures.dart';
import 'package:buscador_de_ceps/domain/entity/search_cep_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchCepRepository {
  Future<Either<Failure, SearchCepEntity>> getSearchCep(String search);
}
