import 'package:equatable/equatable.dart';

class SearchCepEntity extends Equatable {
  final String? zipCode;
  final String? publicPlace;
  final String? district;
  final String? location;
  final String? stateAbreviation;
  final String? ddd;

  const SearchCepEntity(
      {this.zipCode,
      this.publicPlace,
      this.district,
      this.location,
      this.stateAbreviation,
      this.ddd});

  @override
  List<Object?> get props => [
        zipCode,
        publicPlace,
        district,
        location,
        stateAbreviation,
        ddd,
      ];
}
