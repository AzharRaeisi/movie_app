
import 'package:flutter/material.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/custom_appbar.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/home_background.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/popular_movies.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/title_row.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/up_comming_movies.dart';
import 'package:movie_app/shared/theme/app_images.dart';
import 'package:movie_app/shared/theme/app_sizes.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeBackground(),
        SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CustomAppbar(
                  leftIconPath: Assets.imagesMenu,
                  rightIconPath: Assets.imagesNotify,
                  title: 'FilmKu',
                ),
                Padding(
                    padding: AppSizes.defaultt,
                    child:
                        TitleRow(title: 'Now Showing', onSeeMoreTap: () {})),
                const UpCommingMovies(),
                Padding(
                    padding: AppSizes.defaultt,
                    child: TitleRow(title: 'Popular', onSeeMoreTap: () {})),
                const PopularMovies()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
