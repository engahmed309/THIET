import 'package:flutter/material.dart';

class table_day_Item extends StatelessWidget {
  String day;
  table_day_Item(this.day);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 150,
              // width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFF9D9),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber,
            ),
            child: Center(
              child: Text(
                day,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
