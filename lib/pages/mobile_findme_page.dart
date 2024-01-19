import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FindMePage extends StatelessWidget {
  FindMePage({super.key});

  final Uri _linkedinURL =
      Uri.parse('https://www.linkedin.com/in/jakub-mackowski96/');
  final Uri _githubURL = Uri.parse('https://github.com/browsfer');

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          //Text
          Flexible(
            fit: FlexFit.loose,
            child: AutoSizeText(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
                'To learn more about my work and experience, please visit my LinkedIn profile at and my GitHub profile. I am always looking for new opportunities to collaborate, so feel free to connect with me on either platform.'),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: GestureDetector(
                  child: Image.asset('assets/github.png', height: 50),
                  onTap: () {
                    _launchUrl(_githubURL);
                  },
                ),
              ),
              const SizedBox(width: 30),
              Flexible(
                fit: FlexFit.loose,
                child: GestureDetector(
                  child: Image.asset('assets/linkedin.png', height: 50),
                  onTap: () {
                    _launchUrl(_linkedinURL);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
