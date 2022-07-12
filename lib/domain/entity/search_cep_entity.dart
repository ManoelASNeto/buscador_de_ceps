import 'package:equatable/equatable.dart';

class SearchCepEntity extends Equatable {
  final int? zipCode;
  final String? publicPlace;
  final String? district;
  final String? location;
  final String? stateAbreviation;

  const SearchCepEntity({
    this.zipCode,
    this.publicPlace,
    this.district,
    this.location,
    this.stateAbreviation,
  });

  @override
  List<Object?> get props => [
        zipCode,
        publicPlace,
        district,
        location,
        stateAbreviation,
      ];
}
