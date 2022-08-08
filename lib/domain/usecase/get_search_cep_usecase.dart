import 'package:buscador_de_ceps/core/erros/failures.dart';
import 'package:buscador_de_ceps/domain/entity/search_cep_entity.dart';
import 'package:buscador_de_ceps/domain/repositories/i_search_cep_repository.dart';
import 'package:dartz/dartz.dart';

class GetSearchCepUsecase {
  final ISearchCepRepository repository;

  GetSearchCepUsecase(this.repository);

  Future<Either<Failure, SearchCepEntity>> call(String search) async {
    return await repository.getSearchCep(search);
  }
}
