import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/dashboard/presentation/pages/bookmarks.dart';
import 'package:movie_app/features/dashboard/presentation/pages/movies_list.dart';
import 'package:movie_app/features/dashboard/presentation/pages/reels.dart';
import 'package:movie_app/features/dashboard/presentation/providers/index_notifier_provider.dart';
import 'package:movie_app/shared/theme/app_images.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final pages = [const MovieList(), const Reels(), const Bookmarks()];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexNotifierProvider);
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset(Assets.imagesMovies), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(Assets.imagesReels), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(Assets.imagesBookmark), label: ''),
        ],
        currentIndex: index,
        selectedItemColor: Colors.amber[800],
        onTap: ref.read(indexNotifierProvider.notifier).onChange,
      ),
    );
  }
}
