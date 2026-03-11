import 'package:flutter/material.dart';
import 'package:letternotboxd/models/movie_detail.dart';
import 'package:letternotboxd/services/movie_service.dart';

class MovieDetailViewmodel extends ChangeNotifier {
  MovieDetail? _movie;
  final MovieService _movieService;
  late bool _isLoading = false;

  MovieDetailViewmodel({required MovieService movieService})
    : _movieService = movieService;

  bool get isLoading => _isLoading;
  MovieDetail? get movie => _movie;

  Future<void> fetchDetail(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _movie = await _movieService.getMovieDetail(id);
    } catch (e) {
      debugPrint('');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
