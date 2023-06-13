import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const kWhatsappURL =
    'whatsapp://send?text=Hello'; // You can modify the URL scheme as needed
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POC URL SCHEMA',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('POC URL SCHEMA')),
        body: const Center(child: UrlSchemaChecker()),
      ),
    );
  }
}

class UrlSchemaChecker extends StatefulWidget {
  const UrlSchemaChecker({super.key});

  @override
  State<UrlSchemaChecker> createState() => _UrlSchemaCheckerState();
}

class _UrlSchemaCheckerState extends State<UrlSchemaChecker>
    with WidgetsBindingObserver {
  bool isWhatsAppInstalled = false;

  @override
  void initState() {
    super.initState();
    checkIfWhatsAppIsInstalled();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    checkIfWhatsAppIsInstalled();
  }

  Future<void> checkIfWhatsAppIsInstalled() async {
    if (await canLaunchUrl(Uri.parse(kWhatsappURL))) {
      setState(() {
        isWhatsAppInstalled = true;
      });
    } else {
      setState(() {
        isWhatsAppInstalled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isWhatsAppInstalled
        ? InkWell(
            onTap: () => launchUrl(Uri.parse(kWhatsappURL)),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          )
        : const Text('WhatsApp is not installed');
  }
}
