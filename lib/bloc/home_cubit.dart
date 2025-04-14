import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:news_app/bloc/home_states.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourceModel.dart';
import 'package:news_app/widgets/constants.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialState());
  static HomeCubit get(context)=>BlocProvider.of(context);
  SourceModel? sourceModel;
  int selectedIndex=0;


  changeSource(int index){
    selectedIndex=index;
    emit(HomeChangeSource());
  }

  List<Sources>sources=[];
  Future<void>getSources(String categoryId)async{
    emit(SourcesLoadingState());
    Response response=await http.get(
      Uri.parse("https://newsapi.org/v2/top-headlines/sources?category=$categoryId&apiKey=5ab8ce8ff5ea4836bca422bb407e6540")
    );
    var json=jsonDecode(response.body);
    if(response.statusCode==200){
      for(var item in json['sources']){
        sources.add(Sources.fromJson(item));
      }
      emit(SourcesSuccessState());
      getNews(sources[selectedIndex].id!);
    }
    else
    {
      emit(SourcesErrorState());
    }
  }

  List<Articles>articles=[];
  getNews(String sourceId)async{
    emit(ArticlesLoadingState());
    http.Response response = await http.get(
      Uri.parse("https://newsapi.org/v2/everything?sources=$sourceId&language=en"),
      headers: {
        "x-api-key":Constant.apiKey
      }
    );
    var json=jsonDecode(response.body);
    print("response = $json");
    if(response.statusCode==200){
      for(var item in json['articles']){
        articles.add(Articles.fromJson(item));
      }
      emit(ArticlesSuccessState());
    }
    else{
      emit(ArticlesErrorState());
    }

  }
}