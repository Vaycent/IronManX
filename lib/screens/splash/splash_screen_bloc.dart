import '../../models/article_model.dart';

import '../../repositories/content_repository.dart';
import 'package:bloc/bloc.dart';

import 'splash_screen_events.dart';
import 'splash_screen_states.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  ContentRepository _contentRepository;

  SplashScreenBloc(this._contentRepository) : assert(_contentRepository != null);

  @override
  SplashScreenState get initialState => Uninitialised();

  @override
  Stream<SplashScreenState> mapEventToState(SplashScreenEvent event) async* {
    if (event is Initialise) {
      try {
        // final latestDateTime = await _contentRepository.maxValue('PublishDate');
        // List<ArticleModel> articles;

        // if (latestDateTime == null) {
        //   yield Initialising(progress: 0);
        //   articles = await _contentRepository.getAllArticleContentFromSolr();
        // } else {
        //   yield Initialising(progress: 25);
        //   articles = await _contentRepository.getUpdateArticleContentFromSolr(latestDateTime);
        // }

        // if (articles != null) {
        //   await _contentRepository.saveAllArticleContentToDatabase(articles);
        //   yield Initialising(progress: 50);
        // }

        yield Initialising(progress: 100);
        // yield Initialised();
      } catch (ex) {
        print(ex);
        yield NetworkError();
      }
    }
  }
}
