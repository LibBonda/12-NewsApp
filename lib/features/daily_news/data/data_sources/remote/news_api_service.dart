import 'dart:io';

import 'package:retrofit/retrofit.dart';
import'../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
part 'news_api_service.g.dart';

abstract class NewsApiService {

  @RestApi(baseUrl: newsAPIBaseURL)
  abstract class NewsApiService {
    factory: NewsApiService(Dio dio) = _NewsApiService;

    @GET("top-headlines")
    Future<HttpResponse<List<ArticleModel>>> getNewsArticles(){
      @Query("apiKey") String ? apiKey,
      @Query("country") String ? country,
      @Query("category") String ? category,
    }
  }
}
