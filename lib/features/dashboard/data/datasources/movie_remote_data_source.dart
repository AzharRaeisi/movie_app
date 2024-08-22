import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/features/dashboard/data/models/movie_details_model.dart';
import 'package:movie_app/features/dashboard/data/models/movie_model.dart';
import 'package:movie_app/features/dashboard/data/models/video_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getUpcomingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<List<VideoModel>> getMovieVideos(int movieId);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await client.get(
      Uri.parse('${AppConfigs.baseUrl}/movie/upcoming?language=en-US&page=1'),
      headers: {
        'Authorization': 'Bearer ${AppConfigs.accessToken}',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse('${AppConfigs.baseUrl}/movie/popular?language=en-US&page=1'),
      headers: {
        'Authorization': 'Bearer ${AppConfigs.accessToken}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await client.get(
      Uri.parse('${AppConfigs.baseUrl}/movie/$movieId?language=en-US'),
      headers: {
        'Authorization': 'Bearer ${AppConfigs.accessToken}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  @override
  Future<List<VideoModel>> getMovieVideos(int movieId) async {
    final response = await client.get(
      Uri.parse('${AppConfigs.baseUrl}/movie/$movieId/videos?language=en-US'),
       headers: {
        'Authorization': 'Bearer ${AppConfigs.accessToken}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<VideoModel> videos = (jsonData['results'] as List)
          .map((video) => VideoModel.fromJson(video))
          .toList();

      return videos;
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
