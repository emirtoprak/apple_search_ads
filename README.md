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

# Apple Search Ads API - Private and Public Key Generation

This guide will walk you through the process of generating a private key, extracting a public key, and uploading the public key to your Apple Search Ads account. This is essential for managing secure access to your Search Ads accounts via the Apple Search Ads API.

## Prerequisites

- **OpenSSL**: You need OpenSSL installed on your machine.
- **macOS/UNIX**: OpenSSL comes pre-installed.
- **Windows**: You need to download and install OpenSSL.

## Step 1: Generate a Private Key

To generate a private key using the Elliptic Curve Digital Signature Algorithm (ECDSA), run the following command:

```bash
openssl ecparam -genkey -name prime256v1 -noout -out private-key.pem
```

## Parameters
  - **name**: Specifies the curve name. Use prime256v1 for the ECDSA algorithm.
  - **out**: The filename where the generated key will be stored (e.g., `private-key.pem`).

## Example Output
The generated `private-key.pem` file should resemble the following.
Example private key like this:

```vbnet
-----BEGIN EC PRIVATE KEY-----
 ---YOUR-PRIVATE-KEY----
-----END EC PRIVATE KEY-----
```
- **Important**: Always keep your private key secure and never share it. If your private key becomes compromised, you need to re-create a private key and client secret, and reupload it to your Apple Search Ads account.

## Step 2: Extract a Public Key
To extract the public key from the private key, use the following command:

```bash
openssl ec -in private-key.pem -pubout -out public-key.pem
```
## Parameters
  - **in**: The filename of the private key (`private-key.pem`).
  - **out**: The filename where the extracted public key will be stored (`public-key.pem`).

## Example Output
Open the `public-key.pem` file in a text editor. It should look like this:

```vbnet
-----BEGIN PUBLIC KEY-----
MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEOuKrT6zrIYzVdp/BzGrfTNoiJBdG/bn8
8yFSdfjl8e5QAS9KkNHkOiMZJo5D8gIKSCbYJffb4JzQlMYNhXzZbD2CBZ71gjTy
UVAlPDSBniSgthzUn8nlTJKLxPbJ5Tkkg3k06YZJWnkV
-----END PUBLIC KEY-----
```

## Step 3: Upload the Public Key

1. From the Search Ads UI, navigate to `Account Settings > API`.
2. Paste the contents of the `public-key.pem` file (including the `BEGIN` and `END` lines) into the Public Key field.
3. Click Save.

After saving, a group of credentials (including `clientId`, `teamId`, and `keyId`) will be displayed above the public key field. Use these credentials to create a client secret.

## Credentials Example
```lua
clientId: SEARCHADS.---
teamId: SEARCHADS.---
keyId: ---
```
If you need to make edits to the public key, go to `Account Settings > API > Edit`.

## Step 4: Store Your Key Pair
Copy both your private key (`private-key.pem`) and public key (`public-key.pem`) into your working directory for safe keeping. Always ensure these files are stored securely.

For more information, visit the <a rel="noopener" target="_new" href="https://developer.apple.com/documentation/apple_search_ads/implementing_oauth_for_the_apple_search_ads_api">Apple Developer Documentation</a>.


## Usage

```dart
import 'package:apple_search_ads/apple_search_ads.dart';

Future<void> main() async {
  final authenticator = AppleSearchAdsAuthenticator(
    clientId: "YOUR_CLIENT_ID",
    teamId: "YOUR_TEAM_ID",
    orgId: "YOUR-ORG-ID",
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


