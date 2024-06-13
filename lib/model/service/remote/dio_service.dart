import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ricky_monty/model/core/api_urls.dart';
import 'package:ricky_monty/model/service/local/shared_pre_service.dart';

class DioService{
  static final DioService _singleton=DioService._internal();
  static Dio? _dio;
  final SharedPreService _sharedPreService =SharedPreService();

  factory DioService(){
    return _singleton;
  }
  DioService._internal(){
    setup();
  }

  Future<void> setup()async{
    try{
      String? bearerToken= await _sharedPreService.read(key:'token')??null;
      _dio=Dio();
      final headers={
        'Content_type':'application/json',
      };
      if(bearerToken != null){
        headers['Authorization']='Bearer $bearerToken';
        if (kDebugMode) {
          print("Bearer token: $bearerToken");
        }
      }
      final options=BaseOptions(
          baseUrl: ApiUrl.baseUrl,
          headers: headers,
          validateStatus: (v){
            if(v == null){
              return false;
            }
            else {
              return v< 500 ;
            }
          }

      );
      _dio!.options=options;
      _dio!.interceptors.add(LogInterceptor(requestBody: true, responseBody: true,requestHeader: true,responseHeader: true));

    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }
  Future<void> updateHeaders() async{
   String? bearerToken= await _sharedPreService.read(key:'token')??null;
    final headers={
      'Content_type':'application/json',
    };
    if(bearerToken != null){
      headers['Authorization']='Bearer $bearerToken';
      if (kDebugMode) {
        print("Bearer token: $bearerToken");
      }
    }
    final options=BaseOptions(
        baseUrl: ApiUrl.baseUrl,
        headers: headers,
        validateStatus: (v){
          if(v == null){
            return false;
          }
          else {
            return v< 500 ;
          }
        }

    );
    _dio!.options=options;
  }
  Future<Response?> post(String path , {Map? data})async{
    log(path);
    try{
      final response= await _dio!.post(path,data: data);
      // log("${response.statusCode}");
      return response;
    }on FormatException catch (_) {
      throw  FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
    return null;
  }
  Future<Response?> get(String path,{Map<String,dynamic>? queryParameters}) async {
    try{
      final response=await _dio!.get(path,queryParameters: queryParameters);
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
}