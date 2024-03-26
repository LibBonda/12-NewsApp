import 'package:newsapp/core/usecase/usecase.dart';

class GetArticleUseCase implements UseCase<DataState<List<Article>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<Article>>> call(void params) {
    return _articleRepository.getNewsArticles();
    // return Future.delayed(Duration(seconds: 1), () => DataState.success(articles));
  }
}
