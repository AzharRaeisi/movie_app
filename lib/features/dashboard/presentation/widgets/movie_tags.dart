import 'package:flutter/material.dart';
import 'package:movie_app/features/dashboard/domain/entities/movie_details.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/movie_tag.dart';

class MovieTags extends StatelessWidget {
  const MovieTags({
    super.key,
    required this.tags,
  });
  final List<Genre> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: tags.map((tag) => MovieTag(tag: tag.name)).toList(),
    );
  }
}
