import 'package:movie_app/features/dashboard/domain/entities/movie_details.dart';
import 'package:movie_app/features/dashboard/domain/entities/movie.dart';
import 'package:movie_app/features/dashboard/domain/entities/video.dart';

abstract class MovieRepository {
  Future<List<Movie>> getUpcomingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<MovieDetails> getMovieDetails(int movieId);
  Future<List<Video>> getMovieVideos(int movieId);
}
