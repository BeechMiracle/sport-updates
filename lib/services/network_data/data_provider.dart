import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sport_updates/models/news_model.dart';
import 'package:sport_updates/services/network_data/exception.dart';
import 'package:sport_updates/services/network_data/provider.dart';

class NewsDataProvider implements NewsProvider {
  NewsDataProvider.sharedInstance();
  static final NewsDataProvider _shared = NewsDataProvider.sharedInstance();

  factory NewsDataProvider() => _shared;

  @override
  Future<List<NewsData>> getNewsData(http.Client client) async {
    try {
      final response = await client.get(
          Uri.parse(
              'https://newsi-api.p.rapidapi.com/api/category?category=sport&language=en&country=gb'),
          headers: {
            'X-RapidAPI-Key':
                'd08737f928msha054812c3d81f3dp19d6d9jsna1d0f19942f1',
            'X-RapidAPI-Host': 'newsi-api.p.rapidapi.com'
          });

      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);

        List<NewsData> newsdata =
            json.map((dynamic data) => NewsData.fromJson(data)).toList();
        List<NewsData> news =
            newsdata.where((element) => element.hasBody == true).toList();
        return news;
      } else {
        throw CouldNotGetNewsDataException();
      }
    } catch (e) {
      throw CouldNotGetNewsDataException();
    }
  }
}
