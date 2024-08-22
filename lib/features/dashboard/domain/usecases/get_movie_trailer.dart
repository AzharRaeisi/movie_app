import 'package:movie_app/features/dashboard/domain/entities/video.dart';
import 'package:movie_app/features/dashboard/domain/repositories/movie_repository.dart';

class GetMovieTrailer {
  final MovieRepository repository;

  GetMovieTrailer(this.repository);

  Future<List<Video>> execute(int movieId) async {
    return await repository.getMovieVideos(movieId);
  }
}
