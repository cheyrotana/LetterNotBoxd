import 'package:flutter/material.dart';
import 'package:letternotboxd/models/movie.dart';
import 'package:letternotboxd/services/movie_service.dart';

class SearchViewmodel extends ChangeNotifier {
  final MovieService _movieService;
  bool _isLoading = false;
  List<Movie> _results = [];

  SearchViewmodel({required MovieService movieService})
    : _movieService = movieService;

  bool get isLoading => _isLoading;
  List<Movie> get result  => _results;

  Future<void> search(String query) async {
    _isLoading = true;
    notifyListeners();
    try {
      _results = await _movieService.searchMovies(query);
    } catch (e) {
      debugPrint('No Result');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
