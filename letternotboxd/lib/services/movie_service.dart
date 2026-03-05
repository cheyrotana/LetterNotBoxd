import 'dart:convert';

import '../models/cast.dart';
import '../models/movie.dart';
import '../models/movie_detail.dart';
import 'dio_client.dart';

class MovieService {
  final _dio = DioClient().dio;

  Future<List<Movie>> getTrending() async {
    try {
      final response = await _dio.get('/trending/movie/week');
      final List results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Movie>> getNowPlaying() async {
    try {
      final response = await _dio.get('/movie/now_playing');
      final List results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Movie>> getPopular() async {
    try {
      final response = await _dio.get('/movie/popular');
      final List results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    try {
      final response = await _dio.get('/search/movie/query=');
      final List results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Cast>> getMovieCast(int id) async {
    try {
      final response = await _dio.get('/movie/{id}/credits');
      final List results = response.data['results'];
      return results.map((json) => Cast.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieDetail> getMovieDetail(int id) async {
    final movieDetailResponse = await _dio.get('/movie/{id}');
    final cast = await getMovieCast(id);

    return MovieDetail.fromJson(movieDetailResponse.data, cast);
  }
}
