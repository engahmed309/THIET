import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class NewsListTileItem extends StatelessWidget {
  NewsListTileItem(
      {super.key,
      required this.newImage,
      required this.newName,
      required this.newInput});
  String newName;
  String newImage;
  String newInput;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        trailing: CircleAvatar(
          child: Image.network(
            newImage,
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.white,
          radius: 50,
        ),
        title: Text(
          parse(newName).body!.text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.end,
        ),
        subtitle: Text(
          parse(newInput).body!.text,
          style: TextStyle(
              color: Colors.black.withOpacity(.5),
              fontFamily: "ElMessiri",
              fontSize: 20),
          textAlign: TextAlign.end,
          softWrap: true,
          maxLines: 2,
          // overflow: TextOverflow.ellipsis,
        ),
        // subtitle: Text("subtitle"),
      ),
    );
  }
}
