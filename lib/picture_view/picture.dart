import 'package:api/picture_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture.freezed.dart';

@freezed
class Picture with _$Picture {

  const Picture._();

  factory Picture(
      {
        required DateTime date,
        required String title,
        required String url,
        String? hdurl,
        MediaType? mediaType,
        required String explanation,
        required List<String> concepts,
        String? thumbnailUrl,
        String? copyright}) = _Picture;

  String imageUrl() => hdurl ?? url;

  String? copyrightText() => copyright != null ? "© ${copyright!}" : null;
}

extension PictureConverter on PictureEntity {
  Picture toPicture() => Picture(
      date: DateTime.parse(date),
      title: title,
      url: url,
      hdurl: hdurl,
      mediaType: mediaType?.toMediaType(),
      explanation: explanation,
      concepts: concepts?.values.toList() ?? [],
      thumbnailUrl: thumbnailUrl,
      copyright: copyright);
}

enum MediaType { image, video, unknown }

extension MediaTypeConverter on String {
  MediaType toMediaType() {
    switch (this) {
      case "image":
        return MediaType.image;
      case "video":
        return MediaType.video;
      default:
        return MediaType.unknown;
    }
  }
}
