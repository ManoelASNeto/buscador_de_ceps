abstract class SearchCepEvent {}

class CepEvent extends SearchCepEvent {
  String search;

  CepEvent(this.search);
}
