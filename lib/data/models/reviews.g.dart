// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      author: json['author'] as String?,
      content: json['content'] as String?,
      id: json['id'] as String?,
      updated_at: json['updated_at'] as String?,
      author_details: json['author_details'],
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'id': instance.id,
      'updated_at': instance.updated_at,
      'author_details': instance.author_details,
    };
