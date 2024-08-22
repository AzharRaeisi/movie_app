import 'package:movie_app/features/dashboard/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/features/dashboard/domain/entities/movie.dart';
import 'package:movie_app/features/dashboard/domain/entities/movie_details.dart';
import 'package:movie_app/features/dashboard/domain/entities/video.dart';
import 'package:movie_app/features/dashboard/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    return await remoteDataSource.getUpcomingMovies();
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    return await remoteDataSource.getPopularMovies();
  }

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    return await remoteDataSource.getMovieDetails(movieId);
  }

  @override
  Future<List<Video>> getMovieVideos(int movieId) async {
    return await remoteDataSource.getMovieVideos(movieId);
  }
}
