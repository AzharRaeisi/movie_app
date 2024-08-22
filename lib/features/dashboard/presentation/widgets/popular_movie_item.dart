import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/features/dashboard/domain/entities/movie.dart';
import 'package:movie_app/features/dashboard/domain/entities/movie_details.dart';
import 'package:movie_app/features/dashboard/presentation/pages/movie_details_page.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/movie_tags.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/rating.dart';
import 'package:movie_app/shared/theme/app_colors.dart';
import 'package:movie_app/shared/theme/app_fonts.dart';
import 'package:movie_app/shared/theme/app_images.dart';
import 'package:movie_app/shared/theme/app_sizes.dart';

class PopularMovieItem extends StatelessWidget {
  const PopularMovieItem({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => MovieDetailsPage(movie))),
      child: Container(
        margin: AppSizes.verticalOnly(false, true),
        padding: AppSizes.horizontalSymmetric,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: AppSizes.horizontalOnly(false, true),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              width: 85,
              height: 128,
              clipBehavior: Clip.hardEdge,
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        fontFamily: AppFonts.mulish,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        letterSpacing: 0.3,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Rating(rating: movie.voteAverage),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    // TODO implement fetch Genre by ID
                    child: MovieTags(tags: [Genre(id: 54, name: 'Action'), Genre(id: 54, name: 'Science Fiction')]),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 2.6, 4, 1.6),
                        child: SizedBox(
                          width: 9.7,
                          height: 9.7,
                          child: Image.asset(Assets.imagesTime),
                        ),
                      ),
                      const Text(
                        '1h 47m',
                        style: TextStyle(
                          fontFamily: AppFonts.mulish,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          letterSpacing: 0.2,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
