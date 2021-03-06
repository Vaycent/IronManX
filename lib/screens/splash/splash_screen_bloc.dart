import 'package:bloc/bloc.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/article_model.dart';
import '../../models/image_model.dart';
import '../../repositories/content_repository.dart';
import '../../shared_preference_keys.dart';
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
        var latestDateTime = await _contentRepository.maxValue(ArticleModel.TableName, 'PublishDate');
        List<ArticleModel> articles;

        print('MaxArticleDate: $latestDateTime');

        if (latestDateTime == null) {
          yield Initialising(progress: 0);
          // var ff = await _contentRepository.getAllArticleContentFromSolr2();
          // await _contentRepository.fetchAndSaveAllArticleContent();
          await for (var articles in _contentRepository.getAllArticleContentFromSolr2()) {
            if (articles == null) {
              break;
            }
            await _contentRepository.saveAllArticleContentToDatabase(articles);
          }
        } else {
          // yield Initialising(progress: 25);
          final articles = await _contentRepository.getUpdateArticleContentFromSolr(latestDateTime);
          if (articles != null) {
            await _contentRepository.saveAllArticleContentToDatabase(articles);
            yield Initialising(progress: 50);
          }
        }

        latestDateTime = await _contentRepository.maxValue(ImageModel.TableName, 'PublishDate');
        List<ImageModel> images;

        print('MaxImageDate: $latestDateTime');

        if (latestDateTime == null) {
          yield Initialising(progress: 65);
          images = await _contentRepository.getAllImageContentFromSolr();
        } else {
          yield Initialising(progress: 75);
          images = await _contentRepository.getUpdateImageContentFromSolr(latestDateTime);
        }

        if (images != null) {
          await _contentRepository.saveAllImageContentToDatabase(images);
          yield Initialising(progress: 90);
        }

        print('SplashScreenBloc.Initilaised...');
        yield Initialising(progress: 100);

        final prefs = await SharedPreferences.getInstance();
        final packageInfo = await PackageInfo.fromPlatform();
        final versionCode = packageInfo.buildNumber;
        yield Initialised(
          shouldPresentLoginScreen: prefs.getString(SharedPreferenceKeys.shouldPresentOnboardingScreen) != versionCode,
        );
      } catch (ex) {
        print(ex);
        yield NetworkError();
      }
    }
  }
}
