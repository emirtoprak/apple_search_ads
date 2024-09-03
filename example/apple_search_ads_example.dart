import 'package:apple_search_ads/apple_search_ads.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  final authenticator = AppleSearchAdsAuthenticator(
    clientId: "YOUR-CLIENT",
    teamId: "YOUR-TEAM-ID",
    orgId: "YOUR-ORG-ID",
    keyId: "YOUR-KEY-ID",
    keyContent: """
      -----BEGIN EC PRIVATE KEY-----
      YOUR-PRIVATE-KEY-CONTENT
      -----END EC PRIVATE KEY-----
      """,
    verbose: true,
  );

  final accessToken = await authenticator.authenticate();
  if (accessToken != null) {
    debugPrint("Authenticated successfully with access token: $accessToken");
    authenticator.fetchData();
  } else {
    debugPrint("Failed to authenticate");
  }
}
