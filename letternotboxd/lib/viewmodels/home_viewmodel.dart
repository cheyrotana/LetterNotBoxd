import 'package:flutter/material.dart';
import 'package:letternotboxd/models/movie.dart';
import 'package:letternotboxd/services/movie_service.dart';

class HomeViewmodel extends ChangeNotifier {
  final MovieService _movieService;

  bool _isLoading = false;
  List<Movie> _trending = [];
  List<Movie> _nowPlaying = [];
  List<Movie> _popular = [];

  HomeViewmodel({required MovieService movieService})
    : _movieService = movieService;

  bool get isLoading => _isLoading;
  List<Movie> get trending => List.unmodifiable(_trending);
  List<Movie> get nowPlaying => List.unmodifiable(_nowPlaying);
  List<Movie> get popular => List.unmodifiable(_popular);

  Future<void> fetchAll() async {
    _isLoading = true;
    notifyListeners();
    try {
      final results = await Future.wait([
        _movieService.getTrending(),
        _movieService.getNowPlaying(),
        _movieService.getPopular(),
      ]);

      _trending = results[0];
      _nowPlaying = results[1];
      _popular = results[2];
    } catch (e) {
      debugPrint('HomeViewModel fetchAll error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
