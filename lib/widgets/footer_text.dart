import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  final String title;
  const FooterText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: const TextStyle(
          color: Color.fromARGB(255, 237, 237, 237),
        ),
      ),
      
    );
  }
}