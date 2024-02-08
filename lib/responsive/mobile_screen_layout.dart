import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_search_clone/colors.dart';
import 'package:google_search_clone/widgets/mobile/mobile_footer.dart';
import 'package:google_search_clone/widgets/search.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.grey),
        title: SizedBox(
          width: size.width * 0.34,
          child: const DefaultTabController(
            length: 2,
            child: TabBar(
                labelColor: blueColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: blueColor,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Images'),
                ]),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/more-apps.svg',
              color: primaryColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0).copyWith(right: 10),
            child: MaterialButton(
              onPressed: () {},
              color: const Color(0xff1A73EB),
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.25,
                  ),
                  const Search(),
                ],
              ),
              const MobileFooter(),
            ]),
      ),
    );
  }
}
