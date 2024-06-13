import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ricky_monty/Modules/character/model/core/response_model/character_list_response_model.dart';
import 'package:ricky_monty/Modules/character/model/service/remote/character_service.dart';
import 'package:ricky_monty/model/service/remote/api_response.dart';

class CharacterViewModel extends ChangeNotifier{
  final CharacterListService _characterListService=CharacterListRemoteDataSource();
  bool _isLoadingState=false;
  bool _isLoadMoreState=false;
  CharacterListResponseModel? _characterListResponseModel;
  List<Results> _results=[];
  List<Results>? _newResults;

  // int _count=10;
  int _page=1;
  ///For Pagination


  void resetPage(){
    _page=1;
    // _count=10;
    notifyListeners();
  }
  void pageCounter({required BuildContext context}){
    ++_page;
    notifyListeners();
  }

  void clearList(){
    _results.clear();
    notifyListeners();
  }
  bool get isLoadingState => _isLoadingState;
  bool get isLoadMoreState => _isLoadMoreState;
  CharacterListResponseModel? get characterListResponseModel => _characterListResponseModel;
  int? get page => _page;
  // int? get count => _count;
  List<Results> get results => _results;
  List<Results>? get newResults => _newResults;

  Future<bool> characterListFetch(BuildContext context,{dynamic page ,required bool isLoadMore})async{
 _isLoadingState=true;
 bool isFetchList=false;
 _characterListResponseModel =null;
 if(isLoadMore){
   _isLoadMoreState=true;
 }else{
   _results=[];
 }
 try{
   log("============>characterList api call");
 ApiResponse apiResponse=await _characterListService.characterList(page);
 if(apiResponse.response !=null){
   if(apiResponse.response!.statusCode == 200 ){
     _characterListResponseModel =CharacterListResponseModel.fromJson(apiResponse.response!.data);
      _newResults=_characterListResponseModel!.results;
      _results=_results + _newResults!;
      _isLoadingState=false;
      isFetchList=true;
     if(isLoadMore){
       _isLoadMoreState=false;
     }
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          backgroundColor: Colors.green,
          content: Center(child: Text('{SuccessFully Fetch Data}',style: TextStyle(color: Colors.white),)),
        ));
      }
   }
   else{
     _isLoadingState=false;
     isFetchList=false;
     if(isLoadMore){
       _isLoadMoreState=false;
     }
     notifyListeners();
     if(context.mounted){
       ScaffoldMessenger.of(context).removeCurrentSnackBar();
       ScaffoldMessenger.of(context).showSnackBar( SnackBar(
         duration: Duration(milliseconds: 1),
         backgroundColor: Colors.red,
         content: Center(child: Text(' {error}',style: const TextStyle(color: Colors.white),)),
       ));
     }
   }
 }
 else{
   _isLoadingState=false;
   isFetchList=false;
   if(isLoadMore){
     _isLoadMoreState=false;
   }
   notifyListeners();
   if(context.mounted){
     ScaffoldMessenger.of(context).removeCurrentSnackBar();
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
       duration: Duration(milliseconds: 1),
       backgroundColor: Colors.red,
       content: Center(child: Text(' ${apiResponse.error}',style: const TextStyle(color: Colors.white),)),
     ));
   }
 }
 }catch(e){
   _isLoadingState=false;
   isFetchList=false;
   if(isLoadMore){
     _isLoadMoreState=false;
   }
   notifyListeners();
   if(context.mounted){
     ScaffoldMessenger.of(context).removeCurrentSnackBar();
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
       duration: Duration(milliseconds: 1),
       backgroundColor: Colors.red,
       content: Center(child: Text(' $e ',style: const TextStyle(color: Colors.white),)),
     ));
   }
 }
  notifyListeners();
 return isFetchList;
  }



}