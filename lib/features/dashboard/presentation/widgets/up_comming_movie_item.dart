import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/features/dashboard/domain/entities/movie.dart';
import 'package:movie_app/features/dashboard/presentation/pages/movie_details_page.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/rating.dart';
import 'package:movie_app/shared/theme/app_colors.dart';
import 'package:movie_app/shared/theme/app_sizes.dart';

class UpCommingMovieItem extends StatelessWidget {
  const UpCommingMovieItem({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => MovieDetailsPage(movie))),
      child: Container(
        margin: AppSizes.horizontalOnly(false, true),
        width: 143,
        height: 275,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              width: 143,
              height: 212,
              child: CachedNetworkImage(
                imageUrl: "${AppConfigs.iamgeBaseUrl}/w200/${movie.posterPath}",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: 0.3,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            Rating(
              rating: movie.voteAverage,
            ),
          ],
        ),
      ),
    );
  }
}
