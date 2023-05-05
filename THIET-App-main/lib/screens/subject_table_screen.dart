import 'package:flutter/material.dart';

import '../widgets/table_day_item.dart';

class SubjectTableScreen extends StatefulWidget {
  const SubjectTableScreen({Key? key}) : super(key: key);
  static const routeName = "/subjects-table-screen";

  @override
  State<SubjectTableScreen> createState() => _SubjectTableScreenState();
}

class _SubjectTableScreenState extends State<SubjectTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(color: Colors.white),
              Center(
                child: Image.asset(
                  "assets/images/logo.jpg",
                  color: Colors.white.withOpacity(0.07),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 2, left: 2),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            Text('الجداول الدراسيه ',
                                style: Theme.of(context).textTheme.headline1),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'المكان',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'النوع',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'الماده',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'الوقت',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'اليوم',
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  table_day_Item("السبت"),
                  SizedBox(
                    height: 10,
                  ),
                  table_day_Item("الاحد")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
