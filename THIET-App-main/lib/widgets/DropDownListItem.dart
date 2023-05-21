import 'dart:math';
import 'package:flutter/material.dart';
import 'package:thiet_v2/screens/test.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/Subject_Table_screen.dart';

class DropDownListItem extends StatefulWidget {
  @override
  State<DropDownListItem> createState() => _DropDownListItemState();
}

class _DropDownListItemState extends State<DropDownListItem> {
  List<String> menuItems = [
    "الجداول الدراسيه",
    "نتائج الطلاب",
    "طلب تظلم",
  ];
  var isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      // height: 70,
      margin: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "خدمات الطالب",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.end,
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              icon: isExpanded == true
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
            ),
          ),
          if (isExpanded)
            Container(
              height: min(
                menuItems.length * 30 + 30,
                180,
              ),
              child: ListView(
                children: menuItems
                    .map((item) => InkWell(
                              onTap: () {
                                print(item);
                                if (item == "الجداول الدراسيه") {
                                  Navigator.of(context)
                                      .pushNamed(SubjectTableScreen.routeName);
                                } else if (item == "نتائج الطلاب") {
                            launchUrl(Uri.parse("https://erp.thiet.edu.eg/"),mode: LaunchMode.inAppWebView);
                                } else {
                                  Navigator.of(context)
                                      .pushNamed(TestScreen.routeName);
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text(
                                      item,
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.toll_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Text(
                        //       item,
                        //       style: TextStyle(
                        //         color: Theme.of(context).primaryColor,
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
