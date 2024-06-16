import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ricky_monty/Modules/character/model/core/response_model/character_list_response_model.dart';
import 'package:ricky_monty/Modules/character/model/core/response_model/episodes_list_response_model.dart';
import 'package:ricky_monty/Modules/character/model/service/remote/character_service.dart';
import 'package:ricky_monty/model/service/remote/api_response.dart';
import 'package:ricky_monty/utils/colors.dart';

class CharacterViewModel extends ChangeNotifier{
  final CharacterListService _characterListService=CharacterListRemoteDataSource();
  bool _isLoadingState=false;
  bool _isLoadMoreState=false;
  CharacterListResponseModel? _characterListResponseModel;
  List<Character> _character=[];
  List<Character>? _newCharacter;
  List<Episode> _episodes = [];
  int _page=1;



  ///For Pagination
  void resetPage(){
    _page=1;
    notifyListeners();
  }
  void pageCounter({required BuildContext context}){
    ++_page;
    notifyListeners();
  }

  void clearList(){
    _character.clear();
    notifyListeners();
  }
  bool get isLoadingState => _isLoadingState;
  bool get isLoadMoreState => _isLoadMoreState;
  CharacterListResponseModel? get characterListResponseModel => _characterListResponseModel;
  int? get page => _page;
  List<Character> get character => _character;
  List<Character>? get newCharacter => _newCharacter;
  List<Episode> get episodes => _episodes;

  Future<bool> characterListFetch(BuildContext context,{dynamic page ,required bool isLoadMore})async{
 _isLoadingState=true;
 bool isFetchList=false;
 _characterListResponseModel =null;
 if(isLoadMore){
   _isLoadMoreState=true;
 }else{
   _character=[];
 }
 try{
   log("============>characterList api call");
 ApiResponse apiResponse=await _characterListService.characterList(page);
 if(apiResponse.response !=null){
   if(apiResponse.response!.statusCode == 200 ){
     _characterListResponseModel =CharacterListResponseModel.fromJson(apiResponse.response!.data);
      _newCharacter=_characterListResponseModel!.results;
      _character=_character + _newCharacter!;
      _isLoadingState=false;
      isFetchList=true;
     if(isLoadMore){
       _isLoadMoreState=false;
     }
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          duration: Duration(milliseconds: 1),
          backgroundColor: AppColors.primaryColor,
          content: Center(child: Text('{SuccessFully Fetch Data}',style: TextStyle(color: AppColors.baseColorWhite),)),
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
       ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
         duration: Duration(milliseconds: 1),
         backgroundColor: Colors.red,
         content: Center(child: Text(' {error}',style: TextStyle(color: Colors.white),)),
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
       duration: const Duration(milliseconds: 1),
       backgroundColor: Colors.red,
       content: Center(child: Text(' ${apiResponse.error}',style: const TextStyle(color: AppColors.baseColorWhite),)),
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
       duration: const Duration(milliseconds: 1),
       backgroundColor: Colors.red,
       content: Center(child: Text(' $e ',style: const TextStyle(color: Colors.white),)),
     ));
   }
 }
  notifyListeners();
 return isFetchList;
  }
  Future<void> getCharacterEpisodes(BuildContext context, Character character) async {
    _isLoadingState = true;
    _episodes=[];
    try {
      _episodes.clear();
      _episodes = await _characterListService.getEpisodes(character.episode!);
      _isLoadingState = false;
      notifyListeners();
    } catch (e) {
      _isLoadingState = false;
      log('Error fetching episodes: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 1),
          backgroundColor: Colors.red,
          content: Center(child: Text('$e', style: const TextStyle(color: AppColors.baseColorWhite))),
        ));
      }
      notifyListeners();
    }
  }
  Future<List<Character>> getSearchCharacter(BuildContext context, String name) async {
    _isLoadingState = true;
    _characterListResponseModel = null;
    List<Character> searchResults = [];
    log("Searching for character: $name"); // Log the query
    try {
      ApiResponse apiResponse = await _characterListService.getCharacter(name);
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _characterListResponseModel = CharacterListResponseModel.fromJson(apiResponse.response!.data);
        searchResults = _characterListResponseModel!.results!;
        _isLoadingState = false;
        notifyListeners();
      } else {
        _isLoadingState = false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 1),
            backgroundColor: Colors.red,
            content: Center(child: Text(' {error}', style: TextStyle(color: Colors.white))),
          ));
        }
      }
    } catch (e) {
      _isLoadingState = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 1),
          backgroundColor: Colors.red,
          content: Center(child: Text(' $e ', style: const TextStyle(color: Colors.white))),
        ));
      }
    }
    notifyListeners();
    return searchResults;
  }

}