
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/dashboard/presentation/providers/upcomming_movies_notifier_provider.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/up_comming_movie_item.dart';
import 'package:movie_app/shared/theme/app_sizes.dart';

class UpCommingMovies extends ConsumerWidget {
  const UpCommingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final movies = ref.watch(upcommingMoviesNotifierProvider);
    return SizedBox(
      height: 295,
      child: Padding(
        padding: AppSizes.horizontalOnly(true, false),
        child: 
        switch (movies) {
          AsyncData(:final value) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: value.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return  UpCommingMovieItem(movie: value[index],);
            }),
          AsyncError() => const Center(child: Text('Oops, something unexpected happened')),
          _ => const Center(child: CircularProgressIndicator.adaptive())
        }
        ,
      ),
    );
  }
}
