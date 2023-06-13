# poc_url_schema

This POC implements the behavior of launching a specific app via URL and the system handles their path.

There are just 3 steps to setup a dynamic link with another apps:
1. ios/Runner/Info.plist inside dict add the key if not exist and include the app destination
E.g:
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>whatsapp</string>
</array>

2. Handle the path with URLLauncher library https://pub.dev/packages/url_launcher
You could see in main.dart that we use the canLaunchUrl with the path to know if the app exists

3. If canLaunch you could launch the URL sending the correct path to share the content, whatsapp support it by sending as query hello