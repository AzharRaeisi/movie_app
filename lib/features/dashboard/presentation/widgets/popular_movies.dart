import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/dashboard/presentation/providers/popular_movies_notifier_provider.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/popular_movie_item.dart';

class PopularMovies extends ConsumerWidget {
  const PopularMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(popularMoviesNotifierProvider);
    return switch (movies) {
      AsyncData(:final value) => ListView.builder(
          itemCount: value.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return PopularMovieItem(movie: value[index],);
          }),
      AsyncError() =>
        const Center(child: Text('Oops, something unexpected happened')),
      _ => const Center(child: CircularProgressIndicator.adaptive())
    };
  }
}
