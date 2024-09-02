import 'package:apple_search_ads/models/campaign_model.dart';
import 'package:apple_search_ads/models/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campaign_data.g.dart';

@JsonSerializable(explicitToJson: true)
class CampaignData {
  final List<CampaignModel> data;
  final Pagination pagination;
  final dynamic error;

  CampaignData({required this.data, required this.pagination, this.error});

  factory CampaignData.fromJson(Map<String, dynamic> json) =>
      _$CampaignDataFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignDataToJson(this);

    List<CampaignModel> findAllCampaignsByName(String appName) {
    return data.where((campaign) => campaign.name.contains(appName)).toList();
  }
}
