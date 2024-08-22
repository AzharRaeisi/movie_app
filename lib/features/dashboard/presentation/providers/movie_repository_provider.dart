import 'package:http/http.dart' as http;
import 'package:movie_app/features/dashboard/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/features/dashboard/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/features/dashboard/domain/repositories/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

 part 'movie_repository_provider.g.dart';
 
@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref){
  return MovieRepositoryImpl(
    remoteDataSource: MovieRemoteDataSourceImpl(client: http.Client()),
  );
}