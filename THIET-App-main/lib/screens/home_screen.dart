import 'package:flutter/material.dart';
import 'package:thiet_v2/screens/new_screen.dart';
import 'package:thiet_v2/screens/student_info_screen.dart';

import '../widgets/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = "/home-screen";
  @override
  Widget build(BuildContext context) {
    // var data =
    //     (ModalRoute.of(context)?.settings.arguments ?? <dynamic>[]) ;
    //     print("data is $data");
    return Scaffold(
    //  backgroundColor: Color.fromARGB(255, 201, 161, 116),
    
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "الرئيسية",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      endDrawer: MainDrawer(),
      body: NewsScreen(),
    );
  }
}
