import 'package:apple_search_ads/apple_search_ads.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campaign_model.g.dart';

@JsonSerializable()
class CampaignModel {
  final int id;
  final int orgId;
  final String name;
  final BudgetAmount? budgetAmount;
  final DailyBudgetAmount? dailyBudgetAmount;
  final int adamId;
  final String paymentModel;
  final dynamic locInvoiceDetails;
  final List<int> budgetOrders;
  final String startTime;
  final String? endTime;
  final String status;
  final String servingStatus;
  final String creationTime;
  final dynamic servingStateReasons;
  final String modificationTime;
  final bool deleted;
  final String sapinLawResponse;
  final List<String> countriesOrRegions;
  final Map<String, dynamic> countryOrRegionServingStateReasons;
  final List<String> supplySources;
  final String adChannelType;
  final String billingEvent;
  final String displayStatus;
  String? conversionType;

  CampaignModel({
    required this.id,
    required this.orgId,
    required this.name,
    this.budgetAmount,
    this.dailyBudgetAmount,
    required this.adamId,
    required this.paymentModel,
    this.locInvoiceDetails,
    required this.budgetOrders,
    required this.startTime,
    this.endTime,
    required this.status,
    required this.servingStatus,
    required this.creationTime,
    this.servingStateReasons,
    required this.modificationTime,
    required this.deleted,
    required this.sapinLawResponse,
    required this.countriesOrRegions,
    required this.countryOrRegionServingStateReasons,
    required this.supplySources,
    required this.adChannelType,
    required this.billingEvent,
    required this.displayStatus,
    this.conversionType,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignModelToJson(this);
}
