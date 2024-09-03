// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      totalResults: (json['totalResults'] as num).toInt(),
      startIndex: (json['startIndex'] as num).toInt(),
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'startIndex': instance.startIndex,
      'itemsPerPage': instance.itemsPerPage,
    };
