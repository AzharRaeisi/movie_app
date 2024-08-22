import 'package:flutter/material.dart';
import 'package:movie_app/features/dashboard/presentation/contants/genre_list.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/movie_tag.dart';

class MovieTagsById extends StatelessWidget {
  const MovieTagsById({
    super.key,
    required this.tags,
  });
  final List<int> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: tags.map((id) {
        if (genreList.containsKey(id)) return MovieTag(tag: genreList[id]!);
        return const SizedBox();
      }).toList(),
    );
  }
}
