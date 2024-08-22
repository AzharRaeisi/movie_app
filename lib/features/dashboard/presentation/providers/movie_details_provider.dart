import 'package:movie_app/features/dashboard/domain/entities/movie_details.dart';
import 'package:movie_app/features/dashboard/domain/usecases/get_movie_details.dart';
import 'package:movie_app/features/dashboard/presentation/providers/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_provider.g.dart';

@riverpod
Future<MovieDetails> movieDetails(MovieDetailsRef ref, int movieId) async {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return await GetMovieDetails(movieRepository).execute(movieId);
}
