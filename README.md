# Apple Search Ads Dart Package

A Dart package to interact with the Apple Search Ads API using OAuth 2.0 authentication.

## Features

- Authenticate with Apple Search Ads API
- Generate JWT-based client secrets

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  apple_search_ads: ^0.0.2
```
## Usage

```dart
import 'package:apple_search_ads/apple_search_ads.dart';

Future<void> main() async {
  final authenticator = AppleSearchAdsAuthenticator(
    clientId: "YOUR_CLIENT_ID",
    teamId: "YOUR_TEAM_ID",
    keyId: "YOUR_KEY_ID",
    keyContent: "YOUR_PRIVATE_KEY",
    verbose: true,
  );

  final accessToken = await authenticator.authenticate();
  if (accessToken != null) {
    print("Authenticated successfully with access token: $accessToken");
  } else {
    print("Failed to authenticate");
  }
}
```


