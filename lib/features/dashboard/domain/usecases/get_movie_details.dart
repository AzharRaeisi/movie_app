import 'package:movie_app/features/dashboard/domain/entities/movie_details.dart';
import 'package:movie_app/features/dashboard/domain/repositories/movie_repository.dart';

class GetMovieDetails {
  final MovieRepository repository;

  GetMovieDetails(this.repository);

  Future< MovieDetails> execute(int id) async {
    return await repository.getMovieDetails(id);
  }
}
