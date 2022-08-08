import 'package:equatable/equatable.dart';

import '../../domain/entity/search_cep_entity.dart';

class SearchCepModel extends Equatable {
  final String? zipCode;
  final String? publicPlace;
  final String? district;
  final String? location;
  final String? stateAbreviation;

  const SearchCepModel({
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

  factory SearchCepModel.fromJson(Map<String, dynamic> json) => SearchCepModel(
        zipCode: json['cep'],
        publicPlace: json['logradouro'],
        district: json['bairro'],
        location: json['localidade'],
        stateAbreviation: json['uf'],
      );

  factory SearchCepModel.toEntity(SearchCepEntity entity) => SearchCepModel(
        zipCode: entity.zipCode,
        publicPlace: entity.publicPlace,
        district: entity.district,
        location: entity.location,
        stateAbreviation: entity.stateAbreviation,
      );

  SearchCepEntity toEntity() => SearchCepEntity(
        zipCode: zipCode,
        publicPlace: publicPlace,
        district: district,
        location: location,
        stateAbreviation: stateAbreviation,
      );
}
