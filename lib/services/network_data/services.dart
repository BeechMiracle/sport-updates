import 'package:http/http.dart';
import 'package:sport_updates/models/news_model.dart';
import 'package:sport_updates/services/network_data/data_provider.dart';
import 'package:sport_updates/services/network_data/provider.dart';


class NewsService implements NewsProvider {
  final NewsProvider provider;

  const NewsService({required this.provider});

  factory NewsService.data() => NewsService(provider: NewsDataProvider());

  @override
  Future<List<NewsData>> getNewsData(Client client) =>
      provider.getNewsData(client);
}
