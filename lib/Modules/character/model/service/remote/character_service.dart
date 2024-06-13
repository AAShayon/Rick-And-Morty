import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ricky_monty/model/core/api_urls.dart';
import 'package:ricky_monty/model/service/remote/api_error_handler.dart';
import 'package:ricky_monty/model/service/remote/api_response.dart';
import 'package:ricky_monty/model/service/remote/dio_service.dart';

abstract class CharacterListService{
  Future<ApiResponse> characterList(dynamic page);
}

class CharacterListRemoteDataSource extends CharacterListService{
  static final CharacterListRemoteDataSource _singleton = CharacterListRemoteDataSource._internal();
  DioService? _dioService;


  factory CharacterListRemoteDataSource(){
    return _singleton;
  }
  CharacterListRemoteDataSource._internal(){
    _dioService=DioService() ;
  }

  @override
  Future<ApiResponse> characterList(dynamic page) async {
    try{
      log("============>characterList api cal from service");
      // Response? response=await _dioService!.request(
      //   ApiUrl().character,
      //   queryParameters: {
      //   'page': page,
      //   },
      // );
      Response? response=await Dio().request(
        'https://rickandmortyapi.com/api/character?$page',
        options: Options(
          method: 'GET',
        ),
      );
      return ApiResponse.withSuccess(response!);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }

  }
}