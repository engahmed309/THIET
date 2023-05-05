import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thiet_v2/screens/eLearning_screen.dart';
import 'package:thiet_v2/screens/home_screen.dart';
import 'package:thiet_v2/screens/login_screen.dart';
import 'package:thiet_v2/screens/student_info_screen.dart';
import 'package:thiet_v2/widgets/main_drawer_item.dart';
import 'DropDownListItem.dart';
import 'package:http/http.dart' as http;

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //CONTAINER ITEMS IN THE DRAWER
              Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      // bottomRight: Radius.circular(30),
                    ),
                    // color: Theme.of(context).primaryColor,
                  ),
                  width: double.infinity,

                  /// height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.jpg",
                        height: 200,
                        width: double.infinity,
                      ),
                      Text(
                        "المعهد العالي للهندسة و التكنولوجيا بطنطا يرحب بكم ",
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30,),
                      
                    ],
                  )),
              SizedBox(
                height: 10,
              ),

              MainDrawerItem(
                backgroundColor:Theme.of(context).indicatorColor,
                handler: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                  
                },
                icon: (Icons.home),
                iconColor: Colors.white,
                textWidget: Text(
                  "الرئيسية",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),

              MainDrawerItem(
                backgroundColor: Theme.of(context).primaryColor,
                  handler: () {
                    Navigator.of(context).pushNamed(ELearningScreen.routeName);
                  },
                  iconColor: Colors.white,
                  textWidget: Text(
                    "منصة التعليم",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  icon: Icons.school_rounded),
              MainDrawerItem(
                backgroundColor: Theme.of(context).indicatorColor,
                  handler: () {
                    Navigator.of(context)
                        .pushNamed(StudentInfoScreen.routeName);
                    print("Navigated");
                  },
                  iconColor: Colors.white,
                  textWidget: Text(
                    "بيانات الطالب",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  icon: Icons.person),
              DropDownListItem(),
              SizedBox(
                height: 10,
              ),
              // Divider(
              //   color: Theme.of(context).primaryColor,
              //   thickness: 6,
              // ),

              MainDrawerItem(backgroundColor:Theme.of(context).indicatorColor,
                  handler: () {},
                  iconColor: Colors.white,
                  textWidget: Text(
                    "الاعدادات",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  icon: Icons.settings),
              MainDrawerItem(
                backgroundColor: Theme.of(context).primaryColor,
                  handler: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  setState(() {
                    LoginScreen.emailController.clear();
                  LoginScreen.passwordController.clear();
                  });
                  },
                  iconColor: Colors.red,
                  textWidget: Text(
                    "تسجيل الخروج",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  icon: Icons.logout),
            ],
          ),
        ),
      ),
    );
  }
}
