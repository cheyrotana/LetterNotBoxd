import 'package:flutter/material.dart';
import 'package:letternotboxd/models/movie.dart';
import 'package:letternotboxd/services/movie_service.dart';

class WatchlistViewmodel extends ChangeNotifier {
  final MovieService _movieService;
  bool _isLoading = false;
  List<Movie> watchlist = [];

  WatchlistViewmodel({required MovieService movieService}) : _movieService = movieService;
  
  void addMovie(Movie movie) {
    if (!isInWatchlist(movie.id)) {
      watchlist.add(movie);
      notifyListeners();
    }
  }

  void removeMovie(int id) {
    watchlist.removeWhere((m) => m.id == id);
    notifyListeners();
  }

  bool isInWatchlist(int id) {
    return watchlist.any((m) => m.id == id);
  }

}
