import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_search_clone/colors.dart';
import 'package:google_search_clone/screens/search_screen.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Image.asset(
            'assets/images/google-logo.png',
            height: 30,
            width: 92,
          ),
        ),
        const SizedBox(width: 27),
        Container(
          width: size.width * 0.45,
          height: 44,
          decoration: BoxDecoration(
            color: searchColor,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: searchColor),
          ),
          child: TextFormField(
            onFieldSubmitted: (query){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchScreen(
                  searchQuery: query,
                  start: '0',
                )
              ));
            },
            style: const TextStyle(fontSize: 16),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/mic-icon.svg',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.search,
                        color: blueColor,
                      ),
                    ],
                  ),
                ),
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}