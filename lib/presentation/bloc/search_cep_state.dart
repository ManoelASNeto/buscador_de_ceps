import 'package:buscador_de_ceps/domain/entity/search_cep_entity.dart';
import 'package:equatable/equatable.dart';

enum SearchCepStatus {
  loading,
  ready,
  error,
}

class SearchCepState extends Equatable {
  final SearchCepStatus? status;
  final SearchCepEntity? entity;
  final String? message;

  const SearchCepState._(this.status, this.entity, this.message);

  const SearchCepState.initial() : this._(SearchCepStatus.loading, null, null);

  SearchCepState loading() {
    return SearchCepState._(SearchCepStatus.loading, entity, message);
  }

  SearchCepState ready(SearchCepEntity? entity) {
    return SearchCepState._(SearchCepStatus.ready, entity, message);
  }

  SearchCepState error(String? msgErro) {
    return SearchCepState._(SearchCepStatus.error, entity, msgErro);
  }

  @override
  List<Object?> get props => [status, entity, message];
}
