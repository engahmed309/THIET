import 'package:flutter/material.dart';

class StudentInfoItem extends StatelessWidget {
  final String infotext;
  // IconData infoicon;
  Color infoColor;
  var infoData;
  StudentInfoItem(
      {required this.infoColor,
      // required this.infoicon,
      required this.infotext,
      required this.infoData});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: infoColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 30, top: 8),
            child: Text(
              "$infotext",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Text(
            "$infoData",
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
