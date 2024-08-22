import 'package:movie_app/features/dashboard/domain/entities/movie.dart';
import 'package:movie_app/features/dashboard/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/features/dashboard/presentation/providers/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popular_movies_notifier_provider.g.dart';

@riverpod
class PopularMoviesNotifier extends _$PopularMoviesNotifier {
  @override
  Future<List<Movie>> build() async {
    final movieRepository = ref.watch(movieRepositoryProvider);
    return await GetPopularMovies(movieRepository).execute();
  }
}
