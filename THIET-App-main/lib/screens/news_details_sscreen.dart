import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:thiet_v2/screens/new_screen.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const routeName = "news-details-screen";

  @override
  Widget build(BuildContext context) {
    final newItem =
        (ModalRoute.of(context)?.settings.arguments ?? <dynamic>[]) as Map;
        var replacedImg= newItem['photo'].replaceAll('public', 'http://thiet.edu.eg/public/storage');
    print(newItem);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تفاصيل الخبر",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 400,
                    child: InteractiveViewer(
                      boundaryMargin: EdgeInsets.all(20.0),
                      minScale: 0.1,
                      maxScale: 3,
                      child:   Center(
          child: CachedNetworkImage(
          imageUrl: replacedImg,
          progressIndicatorBuilder: (context, url, downloadProgress) => 
                  CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
             ),
        ),
                  )),
                Card(
                  elevation: 6,
                  color: Colors.black.withOpacity(.4),
                  child: Text(
                    newItem['name'],
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Text(
                  parse(newItem['input']).body!.text,
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.end,
                )
              ]),
        ),
      ),
    );
    ;
  }
}
