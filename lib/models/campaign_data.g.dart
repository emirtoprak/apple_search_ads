// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignData _$CampaignDataFromJson(Map<String, dynamic> json) => CampaignData(
      data: (json['data'] as List<dynamic>)
          .map((e) => CampaignModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      error: json['error'],
    );

Map<String, dynamic> _$CampaignDataToJson(CampaignData instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination.toJson(),
      'error': instance.error,
    };
