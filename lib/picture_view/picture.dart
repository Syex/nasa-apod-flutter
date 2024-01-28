import 'package:api/picture_entity.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/foundation.dart';

@immutable
class Picture extends Equatable {
  final DateTime date;
  final String title;
  final String url;
  final String? hdurl;
  final MediaType? mediaType;
  final String explanation;
  final List<String> concepts;
  final String? thumbnailUrl;
  final String? copyright;

  const Picture(
      {required this.date,
      required this.title,
      required this.url,
      this.hdurl,
      this.mediaType,
      required this.explanation,
      required this.concepts,
      this.thumbnailUrl,
      this.copyright});

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
