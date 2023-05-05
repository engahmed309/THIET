import 'package:flutter/material.dart';
import '/screens/eLearning_screen.dart';
import '/screens/login_screen.dart';
import '/screens/new_screen.dart';
import '/screens/news_details_sscreen.dart';
import '/screens/student_info_screen.dart';
import '/screens/subJect_details_screen.dart';
import '/screens/subject_table_screen.dart';
import '/screens/test.dart';

import '/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            titleTextStyle: Theme.of(context).textTheme.headline1,
            backgroundColor: Color.fromRGBO(46, 97, 124, 70),
            centerTitle: true),
        fontFamily: "ElMessiri",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ElMessiri'),
              headline2: const TextStyle(
                  //decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'ElMessiri'),
            ),
        primaryColor: const Color.fromRGBO(46, 97, 124, 70),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        TestScreen.routeName: (context) => const TestScreen(),
        ELearningScreen.routeName: (context) => const ELearningScreen(),
        LoginScreen.routeName: (context) =>  LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        NewsScreen.routeName: (context) => const NewsScreen(),
        SubjectDetailsScreen.routeName: (context) =>
            const SubjectDetailsScreen(),
        SubjectTableScreen.routeName: (context) => const SubjectTableScreen(),
        StudentInfoScreen.routeName: (context) =>  StudentInfoScreen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
      },
    );
  }
}


// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:html/parser.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const testtawy());
// }

// class testtawy extends StatefulWidget {
//   const testtawy({super.key});

//   @override
//   State<testtawy> createState() => _testtawyState();
// }

// class _testtawyState extends State<testtawy> {
//   @override
//   // var a;
//   String ahmed = '';
//   String mh = '';
//   final List news = [];

//   final List newsInput = [];
//   Future getData() async {
//     var url = Uri.parse("https://thiet.edu.eg/api/news");
//     final response = await http.get(url);
//     final List responseBody = jsonDecode(response.body);
//     setState(() {
//       ahmed = responseBody[1]['photo'];

//       news.addAll(responseBody);
//       print(ahmed);
//       print(news);
//       mh = ahmed.replaceAll('public', 'http://thiet.edu.eg/public/storage');
//       // for (var i = 0; i <= news.length; i++) {
//       //   a = news[i]['photo']
//       //       .toString()
//       //       .replaceAll('public', 'http://thiet.edu.eg/public/storage')
//       //       .splitMapJoin(',');
//       //   print(a);
//       // }
//     });
//   }

//   void initState() {
//     getData();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return MaterialApp(

//       home: Scaffold(
//         appBar: AppBar(title: Text("News App")),
//         body: news.isEmpty
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : ListView.builder(
//                 itemBuilder: (context, index) => Card(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "User Id :${news[index]['name']}",
//                             style: TextStyle(color: Colors.green),
//                           ),
//                           Text(
//                             // news[index]['photo'],
    
//                             mh,
//                             style: TextStyle(color: Color.fromARGB(255, 194, 197, 197)),
//                           ),
//                            Image.network(mh, fit: BoxFit.fill),
//                           Text(
//                             news[index]['department_id'].toString(),
//                           ),
//                           Text(
//                             parse(news[index]['input']).body!.text,
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ],
//                       ),
//                     ),
//                 itemCount: news.length),
//       ),
//     );
//   }
// }
