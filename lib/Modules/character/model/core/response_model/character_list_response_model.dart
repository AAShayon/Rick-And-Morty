import 'dart:convert';
/// info : {"count":826,"pages":42,"next":"https://rickandmortyapi.com/api/character?page=2","prev":null}
/// results : [{"id":1,"name":"Rick Sanchez","status":"Alive","species":"Human","type":"","gender":"Male","origin":{"name":"Earth (C-137)","url":"https://rickandmortyapi.com/api/location/1"},"location":{"name":"Citadel of Ricks","url":"https://rickandmortyapi.com/api/location/3"},"image":"https://rickandmortyapi.com/api/character/avatar/1.jpeg","episode":["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2","https://rickandmortyapi.com/api/episode/3","https://rickandmortyapi.com/api/episode/4","https://rickandmortyapi.com/api/episode/5","https://rickandmortyapi.com/api/episode/6","https://rickandmortyapi.com/api/episode/7","https://rickandmortyapi.com/api/episode/8","https://rickandmortyapi.com/api/episode/9","https://rickandmortyapi.com/api/episode/10","https://rickandmortyapi.com/api/episode/11","https://rickandmortyapi.com/api/episode/12","https://rickandmortyapi.com/api/episode/13","https://rickandmortyapi.com/api/episode/14","https://rickandmortyapi.com/api/episode/15","https://rickandmortyapi.com/api/episode/16","https://rickandmortyapi.com/api/episode/17","https://rickandmortyapi.com/api/episode/18","https://rickandmortyapi.com/api/episode/19","https://rickandmortyapi.com/api/episode/20","https://rickandmortyapi.com/api/episode/21","https://rickandmortyapi.com/api/episode/22","https://rickandmortyapi.com/api/episode/23","https://rickandmortyapi.com/api/episode/24","https://rickandmortyapi.com/api/episode/25","https://rickandmortyapi.com/api/episode/26","https://rickandmortyapi.com/api/episode/27","https://rickandmortyapi.com/api/episode/28","https://rickandmortyapi.com/api/episode/29","https://rickandmortyapi.com/api/episode/30","https://rickandmortyapi.com/api/episode/31","https://rickandmortyapi.com/api/episode/32","https://rickandmortyapi.com/api/episode/33","https://rickandmortyapi.com/api/episode/34","https://rickandmortyapi.com/api/episode/35","https://rickandmortyapi.com/api/episode/36","https://rickandmortyapi.com/api/episode/37","https://rickandmortyapi.com/api/episode/38","https://rickandmortyapi.com/api/episode/39","https://rickandmortyapi.com/api/episode/40","https://rickandmortyapi.com/api/episode/41","https://rickandmortyapi.com/api/episode/42","https://rickandmortyapi.com/api/episode/43","https://rickandmortyapi.com/api/episode/44","https://rickandmortyapi.com/api/episode/45","https://rickandmortyapi.com/api/episode/46","https://rickandmortyapi.com/api/episode/47","https://rickandmortyapi.com/api/episode/48","https://rickandmortyapi.com/api/episode/49","https://rickandmortyapi.com/api/episode/50","https://rickandmortyapi.com/api/episode/51"],"url":"https://rickandmortyapi.com/api/character/1","created":"2017-11-04T18:48:46.250Z"},{"id":2,"name":"Morty Smith","status":"Alive","species":"Human","type":"","gender":"Male","origin":{"name":"unknown","url":""},"location":{"name":"Citadel of Ricks","url":"https://rickandmortyapi.com/api/location/3"},"image":"https://rickandmortyapi.com/api/character/avatar/2.jpeg","episode":["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2","https://rickandmortyapi.com/api/episode/3","https://rickandmortyapi.com/api/episode/4","https://rickandmortyapi.com/api/episode/5","https://rickandmortyapi.com/api/episode/6","https://rickandmortyapi.com/api/episode/7","https://rickandmortyapi.com/api/episode/8","https://rickandmortyapi.com/api/episode/9","https://rickandmortyapi.com/api/episode/10","https://rickandmortyapi.com/api/episode/11","https://rickandmortyapi.com/api/episode/12","https://rickandmortyapi.com/api/episode/13","https://rickandmortyapi.com/api/episode/14","https://rickandmortyapi.com/api/episode/15","https://rickandmortyapi.com/api/episode/16","https://rickandmortyapi.com/api/episode/17","https://rickandmortyapi.com/api/episode/18","https://rickandmortyapi.com/api/episode/19","https://rickandmortyapi.com/api/episode/20","https://rickandmortyapi.com/api/episode/21","https://rickandmortyapi.com/api/episode/22","https://rickandmortyapi.com/api/episode/23","https://rickandmortyapi.com/api/episode/24","https://rickandmortyapi.com/api/episode/25","https://rickandmortyapi.com/api/episode/26","https://rickandmortyapi.com/api/episode/27","https://rickandmortyapi.com/api/episode/28","https://rickandmortyapi.com/api/episode/29","https://rickandmortyapi.com/api/episode/30","https://rickandmortyapi.com/api/episode/31","https://rickandmortyapi.com/api/episode/32","https://rickandmortyapi.com/api/episode/33","https://rickandmortyapi.com/api/episode/34","https://rickandmortyapi.com/api/episode/35","https://rickandmortyapi.com/api/episode/36","https://rickandmortyapi.com/api/episode/37","https://rickandmortyapi.com/api/episode/38","https://rickandmortyapi.com/api/episode/39","https://rickandmortyapi.com/api/episode/40","https://rickandmortyapi.com/api/episode/41","https://rickandmortyapi.com/api/episode/42","https://rickandmortyapi.com/api/episode/43","https://rickandmortyapi.com/api/episode/44","https://rickandmortyapi.com/api/episode/45","https://rickandmortyapi.com/api/episode/46","https://rickandmortyapi.com/api/episode/47","https://rickandmortyapi.com/api/episode/48","https://rickandmortyapi.com/api/episode/49","https://rickandmortyapi.com/api/episode/50","https://rickandmortyapi.com/api/episode/51"],"url":"https://rickandmortyapi.com/api/character/2","created":"2017-11-04T18:50:21.651Z"},{"id":3,"name":"Summer Smith","status":"Alive","species":"Human","type":"","gender":"Female","origin":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"location":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"image":"https://rickandmortyapi.com/api/character/avatar/3.jpeg","episode":["https://rickandmortyapi.com/api/episode/6","https://rickandmortyapi.com/api/episode/7","https://rickandmortyapi.com/api/episode/8","https://rickandmortyapi.com/api/episode/9","https://rickandmortyapi.com/api/episode/10","https://rickandmortyapi.com/api/episode/11","https://rickandmortyapi.com/api/episode/12","https://rickandmortyapi.com/api/episode/14","https://rickandmortyapi.com/api/episode/15","https://rickandmortyapi.com/api/episode/16","https://rickandmortyapi.com/api/episode/17","https://rickandmortyapi.com/api/episode/18","https://rickandmortyapi.com/api/episode/19","https://rickandmortyapi.com/api/episode/20","https://rickandmortyapi.com/api/episode/21","https://rickandmortyapi.com/api/episode/22","https://rickandmortyapi.com/api/episode/23","https://rickandmortyapi.com/api/episode/24","https://rickandmortyapi.com/api/episode/25","https://rickandmortyapi.com/api/episode/26","https://rickandmortyapi.com/api/episode/27","https://rickandmortyapi.com/api/episode/29","https://rickandmortyapi.com/api/episode/30","https://rickandmortyapi.com/api/episode/31","https://rickandmortyapi.com/api/episode/32","https://rickandmortyapi.com/api/episode/33","https://rickandmortyapi.com/api/episode/34","https://rickandmortyapi.com/api/episode/35","https://rickandmortyapi.com/api/episode/36","https://rickandmortyapi.com/api/episode/38","https://rickandmortyapi.com/api/episode/39","https://rickandmortyapi.com/api/episode/40","https://rickandmortyapi.com/api/episode/41","https://rickandmortyapi.com/api/episode/42","https://rickandmortyapi.com/api/episode/43","https://rickandmortyapi.com/api/episode/44","https://rickandmortyapi.com/api/episode/45","https://rickandmortyapi.com/api/episode/46","https://rickandmortyapi.com/api/episode/47","https://rickandmortyapi.com/api/episode/48","https://rickandmortyapi.com/api/episode/49","https://rickandmortyapi.com/api/episode/51"],"url":"https://rickandmortyapi.com/api/character/3","created":"2017-11-04T19:09:56.428Z"},{"id":4,"name":"Beth Smith","status":"Alive","species":"Human","type":"","gender":"Female","origin":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"location":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"image":"https://rickandmortyapi.com/api/character/avatar/4.jpeg","episode":["https://rickandmortyapi.com/api/episode/6","https://rickandmortyapi.com/api/episode/7","https://rickandmortyapi.com/api/episode/8","https://rickandmortyapi.com/api/episode/9","https://rickandmortyapi.com/api/episode/10","https://rickandmortyapi.com/api/episode/11","https://rickandmortyapi.com/api/episode/12","https://rickandmortyapi.com/api/episode/14","https://rickandmortyapi.com/api/episode/15","https://rickandmortyapi.com/api/episode/16","https://rickandmortyapi.com/api/episode/18","https://rickandmortyapi.com/api/episode/19","https://rickandmortyapi.com/api/episode/20","https://rickandmortyapi.com/api/episode/21","https://rickandmortyapi.com/api/episode/22","https://rickandmortyapi.com/api/episode/23","https://rickandmortyapi.com/api/episode/24","https://rickandmortyapi.com/api/episode/25","https://rickandmortyapi.com/api/episode/26","https://rickandmortyapi.com/api/episode/27","https://rickandmortyapi.com/api/episode/28","https://rickandmortyapi.com/api/episode/29","https://rickandmortyapi.com/api/episode/30","https://rickandmortyapi.com/api/episode/31","https://rickandmortyapi.com/api/episode/32","https://rickandmortyapi.com/api/episode/33","https://rickandmortyapi.com/api/episode/34","https://rickandmortyapi.com/api/episode/35","https://rickandmortyapi.com/api/episode/36","https://rickandmortyapi.com/api/episode/38","https://rickandmortyapi.com/api/episode/39","https://rickandmortyapi.com/api/episode/40","https://rickandmortyapi.com/api/episode/41","https://rickandmortyapi.com/api/episode/42","https://rickandmortyapi.com/api/episode/43","https://rickandmortyapi.com/api/episode/44","https://rickandmortyapi.com/api/episode/45","https://rickandmortyapi.com/api/episode/46","https://rickandmortyapi.com/api/episode/47","https://rickandmortyapi.com/api/episode/48","https://rickandmortyapi.com/api/episode/49","https://rickandmortyapi.com/api/episode/51"],"url":"https://rickandmortyapi.com/api/character/4","created":"2017-11-04T19:22:43.665Z"},{"id":5,"name":"Jerry Smith","status":"Alive","species":"Human","type":"","gender":"Male","origin":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"location":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"image":"https://rickandmortyapi.com/api/character/avatar/5.jpeg","episode":["https://rickandmortyapi.com/api/episode/6","https://rickandmortyapi.com/api/episode/7","https://rickandmortyapi.com/api/episode/8","https://rickandmortyapi.com/api/episode/9","https://rickandmortyapi.com/api/episode/10","https://rickandmortyapi.com/api/episode/11","https://rickandmortyapi.com/api/episode/12","https://rickandmortyapi.com/api/episode/13","https://rickandmortyapi.com/api/episode/14","https://rickandmortyapi.com/api/episode/15","https://rickandmortyapi.com/api/episode/16","https://rickandmortyapi.com/api/episode/18","https://rickandmortyapi.com/api/episode/19","https://rickandmortyapi.com/api/episode/20","https://rickandmortyapi.com/api/episode/21","https://rickandmortyapi.com/api/episode/22","https://rickandmortyapi.com/api/episode/23","https://rickandmortyapi.com/api/episode/26","https://rickandmortyapi.com/api/episode/29","https://rickandmortyapi.com/api/episode/30","https://rickandmortyapi.com/api/episode/31","https://rickandmortyapi.com/api/episode/32","https://rickandmortyapi.com/api/episode/33","https://rickandmortyapi.com/api/episode/35","https://rickandmortyapi.com/api/episode/36","https://rickandmortyapi.com/api/episode/38","https://rickandmortyapi.com/api/episode/39","https://rickandmortyapi.com/api/episode/40","https://rickandmortyapi.com/api/episode/41","https://rickandmortyapi.com/api/episode/42","https://rickandmortyapi.com/api/episode/43","https://rickandmortyapi.com/api/episode/44","https://rickandmortyapi.com/api/episode/45","https://rickandmortyapi.com/api/episode/46","https://rickandmortyapi.com/api/episode/47","https://rickandmortyapi.com/api/episode/48","https://rickandmortyapi.com/api/episode/49","https://rickandmortyapi.com/api/episode/50","https://rickandmortyapi.com/api/episode/51"],"url":"https://rickandmortyapi.com/api/character/5","created":"2017-11-04T19:26:56.301Z"},{"id":6,"name":"Abadango Cluster Princess","status":"Alive","species":"Alien","type":"","gender":"Female","origin":{"name":"Abadango","url":"https://rickandmortyapi.com/api/location/2"},"location":{"name":"Abadango","url":"https://rickandmortyapi.com/api/location/2"},"image":"https://rickandmortyapi.com/api/character/avatar/6.jpeg","episode":["https://rickandmortyapi.com/api/episode/27"],"url":"https://rickandmortyapi.com/api/character/6","created":"2017-11-04T19:50:28.250Z"},{"id":7,"name":"Abradolf Lincler","status":"unknown","species":"Human","type":"Genetic experiment","gender":"Male","origin":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"location":{"name":"Testicle Monster Dimension","url":"https://rickandmortyapi.com/api/location/21"},"image":"https://rickandmortyapi.com/api/character/avatar/7.jpeg","episode":["https://rickandmortyapi.com/api/episode/10","https://rickandmortyapi.com/api/episode/11"],"url":"https://rickandmortyapi.com/api/character/7","created":"2017-11-04T19:59:20.523Z"},{"id":8,"name":"Adjudicator Rick","status":"Dead","species":"Human","type":"","gender":"Male","origin":{"name":"unknown","url":""},"location":{"name":"Citadel of Ricks","url":"https://rickandmortyapi.com/api/location/3"},"image":"https://rickandmortyapi.com/api/character/avatar/8.jpeg","episode":["https://rickandmortyapi.com/api/episode/28"],"url":"https://rickandmortyapi.com/api/character/8","created":"2017-11-04T20:03:34.737Z"},{"id":9,"name":"Agency Director","status":"Dead","species":"Human","type":"","gender":"Male","origin":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"location":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"image":"https://rickandmortyapi.com/api/character/avatar/9.jpeg","episode":["https://rickandmortyapi.com/api/episode/24"],"url":"https://rickandmortyapi.com/api/character/9","created":"2017-11-04T20:06:54.976Z"},{"id":10,"name":"Alan Rails","status":"Dead","species":"Human","type":"Superhuman (Ghost trains summoner)","gender":"Male","origin":{"name":"unknown","url":""},"location":{"name":"Worldender's lair","url":"https://rickandmortyapi.com/api/location/4"},"image":"https://rickandmortyapi.com/api/character/avatar/10.jpeg","episode":["https://rickandmortyapi.com/api/episode/25"],"url":"https://rickandmortyapi.com/api/character/10","created":"2017-11-04T20:19:09.017Z"},{"id":11,"name":"Albert Einstein","status":"Dead","species":"Human","type":"","gender":"Male","origin":{"name":"Earth (C-137)","url":"https://rickandmortyapi.com/api/location/1"},"location":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"image":"https://rickandmortyapi.com/api/character/avatar/11.jpeg","episode":["https://rickandmortyapi.com/api/episode/12"],"url":"https://rickandmortyapi.com/api/character/11","created":"2017-11-04T20:20:20.965Z"},{"id":12,"name":"Alexander","status":"Dead","species":"Human","type":"","gender":"Male","origin":{"name":"Earth (C-137)","url":"https://rickandmortyapi.com/api/location/1"},"location":{"name":"Anatomy Park","url":"https://rickandmortyapi.com/api/location/5"},"image":"https://rickandmortyapi.com/api/character/avatar/12.jpeg","episode":["https://rickandmortyapi.com/api/episode/3"],"url":"https://rickandmortyapi.com/api/character/12","created":"2017-11-04T20:32:33.144Z"},{"id":13,"name":"Alien Googah","status":"unknown","species":"Alien","type":"","gender":"unknown","origin":{"name":"unknown","url":""},"location":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"image":"https://rickandmortyapi.com/api/character/avatar/13.jpeg","episode":["https://rickandmortyapi.com/api/episode/31"],"url":"https://rickandmortyapi.com/api/character/13","created":"2017-11-04T20:33:30.779Z"},{"id":14,"name":"Alien Morty","status":"unknown","species":"Alien","type":"","gender":"Male","origin":{"name":"unknown","url":""},"location":{"name":"Citadel of Ricks","url":"https://rickandmortyapi.com/api/location/3"},"image":"https://rickandmortyapi.com/api/character/avatar/14.jpeg","episode":["https://rickandmortyapi.com/api/episode/10"],"url":"https://rickandmortyapi.com/api/character/14","created":"2017-11-04T20:51:31.373Z"},{"id":15,"name":"Alien Rick","status":"unknown","species":"Alien","type":"","gender":"Male","origin":{"name":"unknown","url":""},"location":{"name":"Citadel of Ricks","url":"https://rickandmortyapi.com/api/location/3"},"image":"https://rickandmortyapi.com/api/character/avatar/15.jpeg","episode":["https://rickandmortyapi.com/api/episode/10"],"url":"https://rickandmortyapi.com/api/character/15","created":"2017-11-04T20:56:13.215Z"},{"id":16,"name":"Amish Cyborg","status":"Dead","species":"Alien","type":"Parasite","gender":"Male","origin":{"name":"unknown","url":""},"location":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"image":"https://rickandmortyapi.com/api/character/avatar/16.jpeg","episode":["https://rickandmortyapi.com/api/episode/15"],"url":"https://rickandmortyapi.com/api/character/16","created":"2017-11-04T21:12:45.235Z"},{"id":17,"name":"Annie","status":"Alive","species":"Human","type":"","gender":"Female","origin":{"name":"Earth (C-137)","url":"https://rickandmortyapi.com/api/location/1"},"location":{"name":"Anatomy Park","url":"https://rickandmortyapi.com/api/location/5"},"image":"https://rickandmortyapi.com/api/character/avatar/17.jpeg","episode":["https://rickandmortyapi.com/api/episode/3"],"url":"https://rickandmortyapi.com/api/character/17","created":"2017-11-04T22:21:24.481Z"},{"id":18,"name":"Antenna Morty","status":"Alive","species":"Human","type":"Human with antennae","gender":"Male","origin":{"name":"unknown","url":""},"location":{"name":"Citadel of Ricks","url":"https://rickandmortyapi.com/api/location/3"},"image":"https://rickandmortyapi.com/api/character/avatar/18.jpeg","episode":["https://rickandmortyapi.com/api/episode/10","https://rickandmortyapi.com/api/episode/28"],"url":"https://rickandmortyapi.com/api/character/18","created":"2017-11-04T22:25:29.008Z"},{"id":19,"name":"Antenna Rick","status":"unknown","species":"Human","type":"Human with antennae","gender":"Male","origin":{"name":"unknown","url":""},"location":{"name":"unknown","url":""},"image":"https://rickandmortyapi.com/api/character/avatar/19.jpeg","episode":["https://rickandmortyapi.com/api/episode/10"],"url":"https://rickandmortyapi.com/api/character/19","created":"2017-11-04T22:28:13.756Z"},{"id":20,"name":"Ants in my Eyes Johnson","status":"unknown","species":"Human","type":"Human with ants in his eyes","gender":"Male","origin":{"name":"unknown","url":""},"location":{"name":"Interdimensional Cable","url":"https://rickandmortyapi.com/api/location/6"},"image":"https://rickandmortyapi.com/api/character/avatar/20.jpeg","episode":["https://rickandmortyapi.com/api/episode/8"],"url":"https://rickandmortyapi.com/api/character/20","created":"2017-11-04T22:34:53.659Z"}]

CharacterListResponseModel characterListResponseModelFromJson(String str) => CharacterListResponseModel.fromJson(json.decode(str));
String characterListResponseModelToJson(CharacterListResponseModel data) => json.encode(data.toJson());
class CharacterListResponseModel {
  CharacterListResponseModel({
      Info? info, 
      List<Character>? results,}){
    _info = info;
    _results = results;
}

  CharacterListResponseModel.fromJson(dynamic json) {
    _info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Character.fromJson(v));
      });
    }
  }
  Info? _info;
  List<Character>? _results;
CharacterListResponseModel copyWith({  Info? info,
  List<Character>? results,
}) => CharacterListResponseModel(  info: info ?? _info,
  results: results ?? _results,
);
  Info? get info => _info;
  List<Character>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_info != null) {
      map['info'] = _info?.toJson();
    }
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Rick Sanchez"
/// status : "Alive"
/// species : "Human"
/// type : ""
/// gender : "Male"
/// origin : {"name":"Earth (C-137)","url":"https://rickandmortyapi.com/api/location/1"}
/// location : {"name":"Citadel of Ricks","url":"https://rickandmortyapi.com/api/location/3"}
/// image : "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
/// episode : ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2","https://rickandmortyapi.com/api/episode/3","https://rickandmortyapi.com/api/episode/4","https://rickandmortyapi.com/api/episode/5","https://rickandmortyapi.com/api/episode/6","https://rickandmortyapi.com/api/episode/7","https://rickandmortyapi.com/api/episode/8","https://rickandmortyapi.com/api/episode/9","https://rickandmortyapi.com/api/episode/10","https://rickandmortyapi.com/api/episode/11","https://rickandmortyapi.com/api/episode/12","https://rickandmortyapi.com/api/episode/13","https://rickandmortyapi.com/api/episode/14","https://rickandmortyapi.com/api/episode/15","https://rickandmortyapi.com/api/episode/16","https://rickandmortyapi.com/api/episode/17","https://rickandmortyapi.com/api/episode/18","https://rickandmortyapi.com/api/episode/19","https://rickandmortyapi.com/api/episode/20","https://rickandmortyapi.com/api/episode/21","https://rickandmortyapi.com/api/episode/22","https://rickandmortyapi.com/api/episode/23","https://rickandmortyapi.com/api/episode/24","https://rickandmortyapi.com/api/episode/25","https://rickandmortyapi.com/api/episode/26","https://rickandmortyapi.com/api/episode/27","https://rickandmortyapi.com/api/episode/28","https://rickandmortyapi.com/api/episode/29","https://rickandmortyapi.com/api/episode/30","https://rickandmortyapi.com/api/episode/31","https://rickandmortyapi.com/api/episode/32","https://rickandmortyapi.com/api/episode/33","https://rickandmortyapi.com/api/episode/34","https://rickandmortyapi.com/api/episode/35","https://rickandmortyapi.com/api/episode/36","https://rickandmortyapi.com/api/episode/37","https://rickandmortyapi.com/api/episode/38","https://rickandmortyapi.com/api/episode/39","https://rickandmortyapi.com/api/episode/40","https://rickandmortyapi.com/api/episode/41","https://rickandmortyapi.com/api/episode/42","https://rickandmortyapi.com/api/episode/43","https://rickandmortyapi.com/api/episode/44","https://rickandmortyapi.com/api/episode/45","https://rickandmortyapi.com/api/episode/46","https://rickandmortyapi.com/api/episode/47","https://rickandmortyapi.com/api/episode/48","https://rickandmortyapi.com/api/episode/49","https://rickandmortyapi.com/api/episode/50","https://rickandmortyapi.com/api/episode/51"]
/// url : "https://rickandmortyapi.com/api/character/1"
/// created : "2017-11-04T18:48:46.250Z"

Character resultsFromJson(String str) => Character.fromJson(json.decode(str));
String resultsToJson(Character data) => json.encode(data.toJson());
class Character {
  Character({
      dynamic id, 
      dynamic name, 
      dynamic status, 
      dynamic species, 
      dynamic type, 
      dynamic gender, 
      Origin? origin, 
      Location? location, 
      dynamic image, 
      List<String>? episode, 
      dynamic url, 
      dynamic created,}){
    _id = id;
    _name = name;
    _status = status;
    _species = species;
    _type = type;
    _gender = gender;
    _origin = origin;
    _location = location;
    _image = image;
    _episode = episode;
    _url = url;
    _created = created;
}

  Character.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
    _species = json['species'];
    _type = json['type'];
    _gender = json['gender'];
    _origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _image = json['image'];
    _episode = json['episode'] != null ? json['episode'].cast<String>() : [];
    _url = json['url'];
    _created = json['created'];
  }
  dynamic _id;
  dynamic _name;
  dynamic _status;
  dynamic _species;
  dynamic _type;
  dynamic _gender;
  Origin? _origin;
  Location? _location;
  dynamic _image;
  List<String>? _episode;
  dynamic _url;
  dynamic _created;
Character copyWith({  dynamic id,
  dynamic name,
  dynamic status,
  dynamic species,
  dynamic type,
  dynamic gender,
  Origin? origin,
  Location? location,
  dynamic image,
  List<String>? episode,
  dynamic url,
  dynamic created,
}) => Character(  id: id ?? _id,
  name: name ?? _name,
  status: status ?? _status,
  species: species ?? _species,
  type: type ?? _type,
  gender: gender ?? _gender,
  origin: origin ?? _origin,
  location: location ?? _location,
  image: image ?? _image,
  episode: episode ?? _episode,
  url: url ?? _url,
  created: created ?? _created,
);
  dynamic get id => _id;
  dynamic get name => _name;
  dynamic get status => _status;
  dynamic get species => _species;
  dynamic get type => _type;
  dynamic get gender => _gender;
  Origin? get origin => _origin;
  Location? get location => _location;
  dynamic get image => _image;
  List<String>? get episode => _episode;
  dynamic get url => _url;
  dynamic get created => _created;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['status'] = _status;
    map['species'] = _species;
    map['type'] = _type;
    map['gender'] = _gender;
    if (_origin != null) {
      map['origin'] = _origin?.toJson();
    }
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['image'] = _image;
    map['episode'] = _episode;
    map['url'] = _url;
    map['created'] = _created;
    return map;
  }

}

/// name : "Citadel of Ricks"
/// url : "https://rickandmortyapi.com/api/location/3"

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      dynamic name, 
      dynamic url,}){
    _name = name;
    _url = url;
}

  Location.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  dynamic _name;
  dynamic _url;
Location copyWith({  dynamic name,
  dynamic url,
}) => Location(  name: name ?? _name,
  url: url ?? _url,
);
  dynamic get name => _name;
  dynamic get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}

/// name : "Earth (C-137)"
/// url : "https://rickandmortyapi.com/api/location/1"

Origin originFromJson(String str) => Origin.fromJson(json.decode(str));
String originToJson(Origin data) => json.encode(data.toJson());
class Origin {
  Origin({
      dynamic name, 
      dynamic url,}){
    _name = name;
    _url = url;
}

  Origin.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  dynamic _name;
  dynamic _url;
Origin copyWith({  dynamic name,
  dynamic url,
}) => Origin(  name: name ?? _name,
  url: url ?? _url,
);
  dynamic get name => _name;
  dynamic get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}

/// count : 826
/// pages : 42
/// next : "https://rickandmortyapi.com/api/character?page=2"
/// prev : null

Info infoFromJson(String str) => Info.fromJson(json.decode(str));
String infoToJson(Info data) => json.encode(data.toJson());
class Info {
  Info({
      dynamic count, 
      dynamic pages, 
      dynamic next, 
      dynamic prev,}){
    _count = count;
    _pages = pages;
    _next = next;
    _prev = prev;
}

  Info.fromJson(dynamic json) {
    _count = json['count'];
    _pages = json['pages'];
    _next = json['next'];
    _prev = json['prev'];
  }
  dynamic _count;
  dynamic _pages;
  dynamic _next;
  dynamic _prev;
Info copyWith({  dynamic count,
  dynamic pages,
  dynamic next,
  dynamic prev,
}) => Info(  count: count ?? _count,
  pages: pages ?? _pages,
  next: next ?? _next,
  prev: prev ?? _prev,
);
  dynamic get count => _count;
  dynamic get pages => _pages;
  dynamic get next => _next;
  dynamic get prev => _prev;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['pages'] = _pages;
    map['next'] = _next;
    map['prev'] = _prev;
    return map;
  }

}