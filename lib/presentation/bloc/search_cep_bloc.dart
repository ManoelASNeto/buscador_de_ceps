import 'package:bloc/bloc.dart';
import 'package:buscador_de_ceps/core/erros/failures.dart';
import 'package:buscador_de_ceps/domain/usecase/get_search_cep_usecase.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_event.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_state.dart';

class SearchCepBloc extends Bloc<SearchCepEvent, SearchCepState> {
  final GetSearchCepUsecase getSearchCepUsecase;

  SearchCepBloc(this.getSearchCepUsecase)
      : super(const SearchCepState.initial()) {
    on<CepEvent>(
      (event, emit) async {
        emit(state.loading());
        var fold = await getSearchCepUsecase(event.search);
        emit(await fold.fold(
            (failure) => state.error(_mapSearchCepFailureToString(failure)),
            (cep) => state.ready(cep)));
      },
    );
  }
}

String _mapSearchCepFailureToString(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Erro ao conectar ao servidor';
    default:
      return 'Erro tente novamente';
  }
}
