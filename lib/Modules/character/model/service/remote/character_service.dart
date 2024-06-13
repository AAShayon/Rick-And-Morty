import 'package:dio/dio.dart';
import 'package:ricky_monty/model/core/api_urls.dart';
import 'package:ricky_monty/model/service/remote/api_error_handler.dart';
import 'package:ricky_monty/model/service/remote/api_response.dart';
import 'package:ricky_monty/model/service/remote/dio_service.dart';

abstract class CharacterListService{
  Future<ApiResponse> characterList(dynamic page, dynamic limit);
}

class CharacterListRemoteDataSource extends CharacterListService{
  static final CharacterListRemoteDataSource _singleton = CharacterListRemoteDataSource._internal();
  late DioService _dioService;


  factory CharacterListRemoteDataSource(){
    return _singleton;
  }
  CharacterListRemoteDataSource._internal(){
    _dioService=DioService() ;
  }

  @override
  Future<ApiResponse> characterList(dynamic page, dynamic limit) async {
    try{
      Response? response=await _dioService.get(ApiUrl.character,queryParameters: {
        'page': page,
        'limit':limit,

      });
      return ApiResponse.withSuccess(response!);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }

  }
}