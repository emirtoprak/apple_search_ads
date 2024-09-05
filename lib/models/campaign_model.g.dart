// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignModel _$CampaignModelFromJson(Map<String, dynamic> json) =>
    CampaignModel(
      id: (json['id'] as num).toInt(),
      orgId: (json['orgId'] as num).toInt(),
      name: json['name'] as String,
      budgetAmount: json['budgetAmount'] == null
          ? null
          : BudgetAmount.fromJson(json['budgetAmount'] as Map<String, dynamic>),
      dailyBudgetAmount: json['dailyBudgetAmount'] == null
          ? null
          : DailyBudgetAmount.fromJson(
              json['dailyBudgetAmount'] as Map<String, dynamic>),
      adamId: (json['adamId'] as num).toInt(),
      paymentModel: json['paymentModel'] as String,
      locInvoiceDetails: json['locInvoiceDetails'],
      budgetOrders: (json['budgetOrders'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String?,
      status: json['status'] as String,
      servingStatus: json['servingStatus'] as String,
      creationTime: json['creationTime'] as String,
      servingStateReasons: json['servingStateReasons'],
      modificationTime: json['modificationTime'] as String,
      deleted: json['deleted'] as bool,
      sapinLawResponse: json['sapinLawResponse'] as String,
      countriesOrRegions: (json['countriesOrRegions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      countryOrRegionServingStateReasons:
          json['countryOrRegionServingStateReasons'] as Map<String, dynamic>,
      supplySources: (json['supplySources'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      adChannelType: json['adChannelType'] as String,
      billingEvent: json['billingEvent'] as String,
      displayStatus: json['displayStatus'] as String,
      conversionType: json['conversionType'] as String?,
    );

Map<String, dynamic> _$CampaignModelToJson(CampaignModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orgId': instance.orgId,
      'name': instance.name,
      'budgetAmount': instance.budgetAmount,
      'dailyBudgetAmount': instance.dailyBudgetAmount,
      'adamId': instance.adamId,
      'paymentModel': instance.paymentModel,
      'locInvoiceDetails': instance.locInvoiceDetails,
      'budgetOrders': instance.budgetOrders,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'status': instance.status,
      'servingStatus': instance.servingStatus,
      'creationTime': instance.creationTime,
      'servingStateReasons': instance.servingStateReasons,
      'modificationTime': instance.modificationTime,
      'deleted': instance.deleted,
      'sapinLawResponse': instance.sapinLawResponse,
      'countriesOrRegions': instance.countriesOrRegions,
      'countryOrRegionServingStateReasons':
          instance.countryOrRegionServingStateReasons,
      'supplySources': instance.supplySources,
      'adChannelType': instance.adChannelType,
      'billingEvent': instance.billingEvent,
      'displayStatus': instance.displayStatus,
      'conversionType': instance.conversionType,
    };
