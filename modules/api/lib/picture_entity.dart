import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picture_entity.g.dart';

/// JSON model for a single APOD result from the NASA API.
@JsonSerializable()
class PictureEntity extends Equatable {
  final String date;
  final String title;
  final String url;
  final String? hdurl;
  @JsonKey(name: "media_type")
  final String? mediaType;
  final String explanation;
  final Map<int, String>? concepts;
  @JsonKey(name: "thumbnail_url")
  final String? thumbnailUrl;
  final String? copyright;

  const PictureEntity(
      {required this.date,
      required this.title,
      required this.url,
      this.hdurl,
      this.mediaType,
      required this.explanation,
      required this.concepts,
      this.thumbnailUrl,
      this.copyright});

  factory PictureEntity.fromJson(Map<String, dynamic> json) =>
      _$PictureEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PictureEntityToJson(this);

  @override
  List<Object?> get props => [
        date,
        title,
        url,
        hdurl,
        mediaType,
        explanation,
        thumbnailUrl,
        copyright
      ];
}
