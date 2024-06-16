import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ricky_morty/Modules/character/model/core/response_model/character_list_response_model.dart';
import 'package:ricky_morty/Modules/character/model/core/response_model/episodes_list_response_model.dart';
import 'package:ricky_morty/model/service/remote/api_error_handler.dart';
import 'package:ricky_morty/model/service/remote/api_response.dart';
import 'package:ricky_morty/model/service/remote/dio_service.dart';
import 'package:ricky_morty/model/core/api_urls.dart';

abstract class CharacterListService {
  Future<ApiResponse> characterList(dynamic page);
  Future<ApiResponse> getCharacter(String name);
  Future<List<Episode>> getEpisodes(List<String> episodeUrls);

}

class CharacterListRemoteDataSource extends CharacterListService {
  static final CharacterListRemoteDataSource _singleton = CharacterListRemoteDataSource._internal();
  final DioService _dioService=DioService();

  factory CharacterListRemoteDataSource() {
    return _singleton;
  }

  CharacterListRemoteDataSource._internal();


  @override
  Future<ApiResponse> characterList(dynamic page) async {
    try {
      log("============>characterList API call from service");
      Response response = await _dioService.client.request(
        ApiUrl.character,
        queryParameters: {
          'page': page,
        },
        options: Options(method: 'GET'),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getCharacter(String name) async {
    try {
      Response response = await _dioService.client.request(
        'character',
        queryParameters: {
          'name': name,
        },
        options: Options(method: 'GET'),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  @override
  Future<List<Episode>> getEpisodes(List<String> episodeUrls) async {
    List<Episode> episodes = [];
    try {
      for (var episodeUrl in episodeUrls) {
        final response = await _dioService.client.get(episodeUrl);
        if (response.statusCode == 200) {
          final episode = Episode.fromJson(response.data);
          episodes.add(episode);
        } else {
          log('Failed to fetch episode: ${response.statusCode}');
        }
      }
      return episodes;
    } catch (e) {
      log('Error fetching episodes: $e');
      return episodes; // Return empty list or handle error as needed
    }
  }
}
