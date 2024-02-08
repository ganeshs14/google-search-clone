import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';

class SearchFooter extends StatelessWidget {
  const SearchFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          color: footerColor,
          padding: EdgeInsets.symmetric(
              horizontal: size.width <= 768 ? 10 : 150, vertical: 15),
          child: Row(children: [
            const Text(
              'India',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(width: 10),
            Container(
              height: 20,
              width: 0.5,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.circle,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              '101016, Mumbai, Maharashtra',
              style: TextStyle(color: primaryColor, fontSize: 14),
            ),
          ]),
        ),
        const Divider(
          height: 9,
          thickness: 0,
          color: Colors.black26,
        ),
        Container(
          color: footerColor,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: const Row(children: [
            Text(
              'Privacy',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(width: 10),
            Text(
              'Terms',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(width: 10),
            Text(
              'Settings',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ]),
        ),
      ],
    );
  }
}
