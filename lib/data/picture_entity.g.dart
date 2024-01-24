// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PictureEntity _$PictureEntityFromJson(Map<String, dynamic> json) =>
    PictureEntity(
      date: json['date'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      hdurl: json['hdurl'] as String?,
      mediaType: json['media_type'] as String?,
      explanation: json['explanation'] as String,
      concepts: (json['concepts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      thumbnailUrl: json['thumbnail_url'] as String?,
      copyright: json['copyright'] as String?,
    );

Map<String, dynamic> _$PictureEntityToJson(PictureEntity instance) =>
    <String, dynamic>{
      'date': instance.date,
      'title': instance.title,
      'url': instance.url,
      'hdurl': instance.hdurl,
      'media_type': instance.mediaType,
      'explanation': instance.explanation,
      'concepts': instance.concepts?.map((k, e) => MapEntry(k.toString(), e)),
      'thumbnail_url': instance.thumbnailUrl,
      'copyright': instance.copyright,
    };
