import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';
import 'package:google_search_clone/screens/search_header.dart';
import 'package:google_search_clone/services/api_service.dart';
import 'package:google_search_clone/widgets/search_result_component.dart';
import 'package:google_search_clone/widgets/web/search_footer.dart';
import 'package:google_search_clone/widgets/web/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen(
      {super.key, required this.searchQuery, required this.start});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Title(
        color: Colors.blue,
        title: searchQuery,
        child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //web header
              const SearchHeader(),
              Padding(
                padding: EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: SearchTabs()),
              ),
              const Divider(
                height: 0,
                thickness: 0,
              ),
              FutureBuilder<Map<String, dynamic>>(
                future: ApiService()
                    .fetchData(queryTerm: searchQuery, start: start),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: size.width <= 768 ? 10 : 150.0, top: 12),
                          child: Text(
                            'About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['searchTime']})',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?['items'].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: size.width <= 768 ? 10 : 150.0,
                                  top: 12),
                              child: SearchResultComponent(
                                link: snapshot.data?['items'][index]['link'],
                                linkToGo: snapshot.data?['items'][index]
                                    ['formattedUrl'],
                                text: snapshot.data?['items'][index]['title'],
                                desc: snapshot.data?['items'][index]['snippet'],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: start != '0'
                                        ? () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchScreen(
                                                  searchQuery: searchQuery,
                                                  start: (int.parse(start) - 10)
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          }
                                        : () {},
                                    child: const Text(
                                      '< Prev',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: blueColor,
                                      ),
                                    )),
                                const SizedBox(width: 20),
                                TextButton(
                                  onPressed: () {
                                    if (start != '0') {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => SearchScreen(
                                            searchQuery: searchQuery,
                                            start: (int.parse(start) + 10)
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Next >',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: blueColor,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        const SizedBox(height: 20),
                        const SearchFooter(),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),

              //tabs
              //search bar
              //pagination buttons
            ],
          )),
        ),
      ),
    );
  }
}
