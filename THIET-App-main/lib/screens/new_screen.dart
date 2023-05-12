import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:thiet_v2/widgets/news_grid_items.dart';

import '../widgets/news_list_tile_widget.dart';
import 'news_details_sscreen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  static const routeName = "/News-screen";
  static var replacesList = [];
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  final List news = [];
  Future getData() async {
    var url = Uri.parse("https://thiet.edu.eg/api/news");
    final response = await http.get(url);
    final responseBody = jsonDecode(response.body);
    NewsScreen.replacesList = responseBody.map((myMap) {
      return {
        "photo": myMap["photo"]!
            .replaceAll('public', 'http://thiet.edu.eg/public/storage'),
      };
    }).toList();

    setState(() {
      news.addAll(responseBody);
    });
  }

  void initState() {
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return news.isEmpty
        ? Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircularProgressIndicator(),
              Text(
                "جاري تحميل الاخبار",
                style: Theme.of(context).textTheme.headline2,
              ),
            ]),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        NewsDetailsScreen.routeName,
                        arguments: news[index],
                      );
                    },
                    child: NewsGridItem(
                      newImage: NewsScreen.replacesList[index]['photo'],
                      newName: news[index]['name'],
                    ),
                  );
                },

                itemCount: news.length,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .3,
                  autoPlay: true,
                ),

                // items: news.map((index) {
                //   return Builder(
                //     builder: (BuildContext context) {
                //       return NewsGridItem(
                //         newImage: NewsScreen.replacesList[index]['photo'],
                //         newName: news[index]['name'],
                //       );
                //     },
                //   );
                // }).toList(),
              ),
              Divider(
                  color: Theme.of(context).primaryColor,
                  height: 5,
                  thickness: 3),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "  ...أخر أخبار المعهد",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Divider(
                  color: Theme.of(context).primaryColor,
                  height: 5,
                  thickness: 3),
              Expanded(
                // height: MediaQuery.of(context).size.height * .5,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  // maxCrossAxisExtent: 300,
                  // childAspectRatio: .9,
                  // crossAxisSpacing: 0,
                  // mainAxisSpacing: 0),
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          NewsDetailsScreen.routeName,
                          arguments: news[index],
                        );
                      },
                      child: NewsListTileItem(
                        newInput: news[index]['input'],
                        newImage: NewsScreen.replacesList[index]['photo'],
                        newName: news[index]['name'],
                      ),
                    );
                  },
                ),
              )
            ],
          );
  }
}


// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:html/parser.dart';
// import 'package:http/http.dart' as http;

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   final List news = [];
//   final List newsInput = [];
//   Future getData() async {
//     var url = Uri.parse("https://thiet.edu.eg/api/news");
//     final response = await http.get(url);
//     final responseBody = jsonDecode(response.body);
//     print(responseBody);

//     setState(() {
//       news.addAll(responseBody);
//     });
//   }

//   void initState() {
//     getData();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("News App")),
//       body: news.isEmpty
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemBuilder: (context, index) => Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "User Id :${news[index]['name']}",
//                           style: TextStyle(color: Colors.green),
//                         ),
//                         Text(
//                           news[index]['photo'],
//                           style: TextStyle(color: Colors.cyan),
//                         ),
//                         Text(
//                           news[index]['department_id'].toString(),
//                         ),
//                         Text(
//                           parse(news[index]['input']).body!.text,
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ),
//               itemCount: news.length),
//     );
//   }
// }
