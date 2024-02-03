import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_entity.freezed.dart';
part 'picture_entity.g.dart';

/// JSON model for a single APOD result from the NASA API.
@freezed
class PictureEntity with _$PictureEntity {
  factory PictureEntity(
      {required final String date,
      required final String title,
      required final String url,
      String? hdurl,
      @JsonKey(name: "media_type") String? mediaType,
      required String explanation,
      Map<int, String>? concepts,
      @JsonKey(name: "thumbnail_url") String? thumbnailUrl,
      String? copyright}) = _PictureEntity;

  factory PictureEntity.fromJson(Map<String, dynamic> json) =>
      _$PictureEntityFromJson(json);
}
