import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';
import 'package:google_search_clone/widgets/footer_text.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "India",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FooterText(title: 'About'),
              SizedBox(width: 7),
              FooterText(title: 'Advertising'),
              SizedBox(width: 7),
              FooterText(title: 'Business'),
              SizedBox(width: 7),
              FooterText(title: 'How Search Works'),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FooterText(title: 'Privacy'),
              SizedBox(width: 10),
              FooterText(title: 'Terms'),
              SizedBox(width: 10),
              FooterText(title: 'Settings'),
            ],
          )
        ],
      ),
    );
  }
}
