import 'package:flutter/material.dart';
import 'package:thiet_v2/screens/news_details_sscreen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsGridItem extends StatelessWidget {
  String newName;
  String newImage;

  NewsGridItem({required this.newName, required this.newImage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Center(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: newImage,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          // Container(
          //   alignment: Alignment.bottomCenter,
          //   color: Theme.of(context).primaryColor.withOpacity(.1),
          //   width: double.infinity,
          //   height: 50,
          //   child: Text(
          //     newName.toString(),
          //     style: Theme.of(context).textTheme.headline2,
          //     softWrap: true,
          //     overflow: TextOverflow.ellipsis,
          //     textAlign: TextAlign.end,
          //   ),
          // ),
        ]),
      ),
    );
  }
}
