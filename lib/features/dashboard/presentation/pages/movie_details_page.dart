// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/features/dashboard/domain/entities/movie.dart';
import 'package:movie_app/features/dashboard/presentation/pages/tailer_page.dart';
import 'package:movie_app/features/dashboard/presentation/providers/movie_details_provider.dart';
import 'package:movie_app/features/dashboard/presentation/providers/trailor_provider.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/custom_appbar.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/movie_tags.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/rating.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/title_row.dart';
import 'package:movie_app/shared/theme/app_colors.dart';
import 'package:movie_app/shared/theme/app_fonts.dart';
import 'package:movie_app/shared/theme/app_images.dart';
import 'package:movie_app/shared/theme/app_sizes.dart';

class MovieDetailsPage extends ConsumerWidget {
  const MovieDetailsPage(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetails = ref.watch(movieDetailsProvider(movie.id));
    final trailors = ref.watch(TrailorProvider(movie.id));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kPrimaryColor,
            height: 300,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: '${AppConfigs.iamgeBaseUrl}/w500/${movie.posterPath}',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: kPrimaryColor,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SafeArea(
                  child: CustomAppbar(
                      leftIconPath: Assets.imagesBack,
                      onLeftIconTap: () => Navigator.pop(context),
                      rightIconPath: Assets.imagesThreeDots)),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 52),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        margin: EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white, // White background color
                          shape:
                              BoxShape.circle, // Make the background circular
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (trailors.value != null &&
                                trailors.value!.isNotEmpty) {
                              final trailerKey = trailors.value!.first.key;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TailerPage(videoId: trailerKey),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Trailer not available')),
                              );
                            }
                          },
                          icon: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors
                                .black, // Replace with kBlackColor if you have a custom color
                          ),
                        ),
                      ),
                      Text(
                        'Play Trailor',
                        style: TextStyle(
                          fontFamily: AppFonts.muli,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          letterSpacing: 0.2,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                  ),
                  padding: AppSizes.horizontalSymmetric,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, top: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontFamily: AppFonts.merriweather,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    letterSpacing: 0.3,
                                    color: kBlackColor,
                                  ),
                                  maxLines: 5,
                                ),
                              ),
                              Padding(
                                padding: AppSizes.horizontalOnly(true, false),
                                child: Image.asset(
                                  Assets.imagesBookmark,
                                  color: kBlackColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Rating(
                          rating: movie.voteAverage,
                        ),
                        Padding(
                          padding: AppSizes.verticalSymmetric,
                          child: MovieTags(
                              tags: movieDetails.valueOrNull?.genres ?? []),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RowItem(
                                label: 'Length',
                                text: '2h 28m',
                              ),
                              RowItem(
                                  label: 'Language',
                                  text: movieDetails.valueOrNull
                                          ?.spokenLanguages.first.name ??
                                      ''),
                              RowItem(
                                label: 'Rating',
                                text: 'PG-13',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text('Description',
                              style: const TextStyle(
                                fontFamily: AppFonts.merriweather,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                letterSpacing: 0.3,
                                color: kPrimaryColor,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Text(
                              "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
                              style: const TextStyle(
                                fontFamily: AppFonts.mulish,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.8,
                                letterSpacing: 0.3,
                                color: kSecondaryColor,
                              )),
                        ),
                        Padding(
                            padding: AppSizes.verticalOnly(false, true),
                            child:
                                TitleRow(title: 'Cast', onSeeMoreTap: () {})),
                        SizedBox(
                          height: 140,
                          child: movieDetails.value != null
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: movieDetails
                                      .value!.productionCompanies.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      // color: Colors.red,
                                      width: 80,
                                      margin: EdgeInsets.only(right: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            width: 72,
                                            height: 72,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  "${AppConfigs.iamgeBaseUrl}/w500/${movieDetails.value!.productionCompanies[index].logoPath}",
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator
                                                              .adaptive()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(
                                                Icons.error,
                                                color: kPrimaryColor,
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Text(
                                            movieDetails
                                                .value!
                                                .productionCompanies[index]
                                                .name,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontFamily: AppFonts.muli,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                letterSpacing: 0.2,
                                                color: kPrimaryColor,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                              : Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 12.6, 5),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: AppFonts.mulish,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              letterSpacing: 0.2,
              color: Color(0xFF9C9C9C),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: AppFonts.mulish,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 0.2,
            color: Color(0xFF000000),
          ),
        ),
      ],
    );
  }
}
