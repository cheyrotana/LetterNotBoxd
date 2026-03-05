import 'cast.dart';
import 'movie.dart';

class MovieDetail extends Movie {
  final int runtime;
  final List<String> genres;
  final List<Cast> cast;

  MovieDetail({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required this.runtime,
    required this.genres,
    required this.cast,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json, List<Cast> cast) {
    return MovieDetail(
      id: json['id'],
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      runtime: json['runtime'] ?? 0,
      // TMDB returns genres as [{"id": 1, "name": "Action"}, ...]
      // We only need the name so we map and extract it
      genres: (json['genres'] as List).map((g) => g['name'] as String).toList(),
      cast: cast,
    );
  }
}
