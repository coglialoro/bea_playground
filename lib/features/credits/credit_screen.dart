import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: const Text("Memory images by brgfx"),
                  onTap: () => _launchUrl(
                      "https://www.freepik.com/free-vector/animal-memory-card-game_29099303.htm"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: const Text("Icon by by Vectors Market - Flaticon"),
                  onTap: () => _launchUrl(
                      "https://www.flaticon.com/free-icons/alphabet"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl(String urlString) async {
  var _url = Uri.parse(urlString);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
