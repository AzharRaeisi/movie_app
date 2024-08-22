import 'package:movie_app/features/dashboard/domain/entities/movie.dart';
import 'package:movie_app/features/dashboard/domain/repositories/movie_repository.dart';

class GetUpcomingMovies {
  final MovieRepository repository;

  GetUpcomingMovies(this.repository);

  Future<List<Movie>> execute() async {
    return await repository.getUpcomingMovies();
  }
}
