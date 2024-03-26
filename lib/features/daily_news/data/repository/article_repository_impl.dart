import 'dart:io';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/dailynews/domain/entities/article_entity.dart';
import 'package:newsapp/features/daily_news/data/models/article.dart';
import 'package:newsapp/features/daily_news/domain/entities/repository/article_repository.dart';

import '../../../../core/constants/constants.dart';
import '../data_sources/remote/news_api_service.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;


  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
  try {

    final HttpResponse = await _newsApiService.getNewsArticles(
      apiKey: newsAPIKey,
      country: countryQuery,
      category: categoryQuery,
    );

    if (HttpResponse.statusCode == HttpStatus.ok) {
      return DataSuccess(HttpResponse.data);
      // return DataSuccess(HttpResponse.data);
    } else {
      return DataFailed(
        DioError(
          error: HttpResponse.response.statusMessage,
          response:HttpResponse.response,
          type: DioErrorType.response,
          requestOptions: HttpResponse.response.requestOptions,
        )

      );
    }
  } on DioError catch (e) {
    return DataFailed(e);}
}
