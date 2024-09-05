import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:apple_search_ads/models/campaign_data.dart';
import 'package:apple_search_ads/models/campaign_model.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_asa_attribution/flutter_asa_attribution.dart';
import 'package:http/http.dart' as http;

class AppleSearchAdsAuthenticator {
  final String clientId;
  final String teamId;
  final String orgId;
  final String keyId;
  final String keyContent;
  final bool verbose;
  String? accessToken;

  AppleSearchAdsAuthenticator({
    required this.clientId,
    required this.teamId,
    required this.orgId,
    required this.keyId,
    required this.keyContent,
    this.verbose = false,
  });

  String generateClientSecret() {
    if (Platform.isAndroid) return "";
    const audience = "https://appleid.apple.com";
    final issuedAtTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final expirationTimestamp = issuedAtTimestamp + 86400 * 180;

    final jwt = JWT(
      {
        "sub": clientId,
        "aud": audience,
        "iat": issuedAtTimestamp,
        "exp": expirationTimestamp,
        "iss": teamId,
      },
      header: {
        "alg": "ES256",
        "kid": keyId,
      },
    );

    final clientSecret = jwt.sign(
      ECPrivateKey(keyContent),
      algorithm: JWTAlgorithm.ES256,
    );

    return clientSecret;
  }

  Future<String?> authenticate() async {
    if (Platform.isAndroid) return null;
    final clientSecret = generateClientSecret();

    final response = await http.post(
      Uri.parse("https://appleid.apple.com/auth/oauth2/token"),
      headers: {
        "Host": "appleid.apple.com",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "grant_type": "client_credentials",
        "client_id": clientId,
        "client_secret": clientSecret,
        "scope": "searchadsorg",
      },
    );

    if (response.statusCode == 200) {
      final resultJson = jsonDecode(response.body);
      if (verbose) {
        log(resultJson.toString());
      }
      accessToken = resultJson["access_token"];
      return accessToken;
    } else {
      log("Failed to authenticate: ${response.statusCode} ${response.body}");
      return null;
    }
  }

  Future<CampaignData?> fetchData() async {
    if (Platform.isAndroid) return null;
    final authenticator = AppleSearchAdsAuthenticator(
      clientId: clientId,
      teamId: teamId,
      orgId: orgId,
      keyId: keyId,
      keyContent: keyContent,
      verbose: true,
    );

    final accessToken = await authenticator.authenticate();

    if (accessToken != null) {
      final response = await http.get(
        Uri.parse("https://api.searchads.apple.com/api/v5/campaigns"),
        headers: {
          "Authorization": "Bearer $accessToken",
          "Content-Type": "application/json",
          "X-AP-Context": "orgId=$orgId",
        },
      );
      String? conversionType = await getConversionType();

      if (response.statusCode == 200) {
        final campaignsData = jsonDecode(response.body);
        CampaignData campaignData = CampaignData.fromJson(campaignsData);
        for (var element in campaignData.data) {
          element.conversionType = conversionType;
        }
        return campaignData;
      } else {
        log("Error: ${response.statusCode} ${response.body}");
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String?> getConversionType() async {
    if (Platform.isAndroid) return null;
    String? conversionType;

    final token = await FlutterAsaAttribution.instance.attributionToken();

    if (token == null) conversionType = null;

    final datas =
        await FlutterAsaAttribution.instance.requestAttributionDetails();

    if (datas != null && datas.isNotEmpty) {
      conversionType = datas["conversionType"];
    }
    return conversionType;
  }

  Future<List<CampaignModel>> findAllCampaigns(
      {required String appName}) async {
    if (Platform.isAndroid) return [];

    final CampaignData? data = await fetchData();
    if (data == null) {
      return [];
    }
    List<CampaignModel> matchingCampaigns =
        data.findAllCampaignsByName(appName);
    String? conversionType = await getConversionType();
    for (var element in matchingCampaigns) {
      element.conversionType = conversionType;
    }
    return matchingCampaigns;
  }

  Future<CampaignModel?> getCampaingById({required int id}) async {
    if (Platform.isAndroid) return null;
    const String red = '\x1B[31m';
    try {
      final CampaignData? data = await fetchData();
      if (data == null) {
        throw Exception("Failed to fetch data");
      }
      final campaign =
          data.data.firstWhere((element) => element.id == id, orElse: () {
        log("Campaign with id $id not found");
        throw Exception("Campaign with id $id not found");
      });
      String? conversionType = await getConversionType();
      campaign.conversionType = conversionType;
      return campaign;
    } on Exception catch (e) {
      log(
        "$red${e.toString()}",
        name: 'Get campaign by id',
      );
    }
    return null;
  }

  Future<CampaignData?> getEnabledCampaign() async {
    if (Platform.isAndroid) return null;
    CampaignData? data = await fetchData();
    if (data == null) {
      return null;
    }
    List<CampaignModel> resultCampaign = [];
    for (var element in data.data) {
      if (element.status == 'ENABLED') {
        resultCampaign.add(element);
      }
    }
    return resultCampaign.isNotEmpty
        ? CampaignData(data: resultCampaign, pagination: data.pagination)
        : null;
  }
}
