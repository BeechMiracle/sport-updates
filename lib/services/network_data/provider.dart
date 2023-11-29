import 'package:http/http.dart' as http;
import 'package:sport_updates/models/news_model.dart';

abstract class NewsProvider {
  Future<List<NewsData>> getNewsData(http.Client client);
}
