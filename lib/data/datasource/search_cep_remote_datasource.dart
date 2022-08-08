import 'dart:convert';

import 'package:buscador_de_ceps/core/device/network_info.dart';
import 'package:buscador_de_ceps/core/erros/exceptions.dart';
import 'package:buscador_de_ceps/core/utils/endpoints.dart';
import 'package:buscador_de_ceps/data/models/search_cep_model.dart';
import 'package:http/http.dart' as http;

import '../models/search_cep_model.dart';

abstract class ISearchCepRemoteDataSource {
  Future<SearchCepModel> searchCepModel(String search);
}

class SearchCepRemoteDataSource implements ISearchCepRemoteDataSource {
  final client = http.Client();
  final INetworkInfo networkInfo;

  SearchCepRemoteDataSource(this.networkInfo);

  @override
  Future<SearchCepModel> searchCepModel(String search) async {
    final searchCep = Uri.parse(('${EndPoints.url}$search${EndPoints.search}'));
    if (await networkInfo.isConnected) {
      final response = await client.get(searchCep);
      switch (response.statusCode) {
        case 200:
          final responseJson = jsonDecode(response.body);
          return SearchCepModel.fromJson(responseJson);
        default:
          throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }
}
