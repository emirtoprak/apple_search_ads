import 'package:apple_search_ads/apple_search_ads.dart';

Future<void> main() async {
  final authenticator = AppleSearchAdsAuthenticator(
    clientId: "YOUR-CLIENT",
    teamId: "YOUR-TEAM-ID",
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
    print("Authenticated successfully with access token: $accessToken");
  } else {
    print("Failed to authenticate");
  }
}
