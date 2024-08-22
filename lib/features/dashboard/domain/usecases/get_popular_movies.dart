
import 'package:movie_app/features/dashboard/domain/entities/movie.dart';
import 'package:movie_app/features/dashboard/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future< List<Movie>> execute() async {
    return await repository.getPopularMovies();
  }
}
