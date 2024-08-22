import 'package:movie_app/features/dashboard/domain/entities/video.dart';
import 'package:movie_app/features/dashboard/domain/usecases/get_movie_trailer.dart';
import 'package:movie_app/features/dashboard/presentation/providers/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trailor_provider.g.dart';

@riverpod
Future<List<Video>> trailor(TrailorRef ref, int movieId) async {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return await GetMovieTrailer(movieRepository).execute(movieId);
}
