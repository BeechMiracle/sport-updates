import 'package:sport_updates/models/sport_model.dart';

class Sport {
  final List<SportData> _allSport = [
    SportData(
      country: 'England',
      league: 'Premier League',
      homeTeam: 'Home',
      awayTeam: 'Away',
      homeImageUrl: 'homeImageUrl',
      awayImageUrl: 'awayImageUrl',
      prediction: 'Home',
      sport: 'Football',
      dateTime: 'dateTime',
    ),
    SportData(
      country: 'USA',
      league: 'NBA',
      homeTeam: 'Home',
      awayTeam: 'Away',
      homeImageUrl: 'homeImageUrl',
      awayImageUrl: 'awayImageUrl',
      prediction: 'Home',
      sport: 'Basketball',
      dateTime: 'dateTime',
    ),
    SportData(
      country: 'USA',
      league: 'NBA',
      homeTeam: 'Home',
      awayTeam: 'Away',
      homeImageUrl: 'homeImageUrl',
      awayImageUrl: 'awayImageUrl',
      prediction: 'Home',
      sport: 'Basketball',
      dateTime: 'dateTime',
    ),
    SportData(
      country: 'NBA',
      league: 'NHL',
      homeTeam: 'Home',
      awayTeam: 'Away',
      homeImageUrl: 'homeImageUrl',
      awayImageUrl: 'awayImageUrl',
      prediction: 'Home',
      sport: 'Hockey',
      dateTime: 'dateTime',
    ),
    SportData(
      country: 'France',
      league: 'France open',
      homeTeam: 'Home',
      awayTeam: 'Away',
      homeImageUrl: 'homeImageUrl',
      awayImageUrl: 'awayImageUrl',
      prediction: 'Home',
      sport: 'Tennis',
      dateTime: 'dateTime',
    ),
  ];

  List<SportData> get allSport => _allSport;
}
