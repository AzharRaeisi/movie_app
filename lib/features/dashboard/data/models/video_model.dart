import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/dashboard/domain/entities/video.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel extends Video with _$VideoModel {
  const factory VideoModel({
    required String id,
    required String key,
    required String name,
    required String site,
    required String type,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}
