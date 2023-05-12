import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thiet_v2/screens/login_screen.dart';
import '../widgets/student_info_item.dart';
import 'package:http/http.dart' as http;

class StudentInfoScreen extends StatefulWidget {
  static var routeName = '/student-info-screen';
  static var baseRequestUrl = '';
  StudentInfoScreen({Key? key}) : super(key: key);
  @override
  State<StudentInfoScreen> createState() => _StudentInfoScreenState();
}

class _StudentInfoScreenState extends State<StudentInfoScreen> {
  final Map studentinfo = {};
  void initState() {
    fetchStudentInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "بيانات الطالب ",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: studentinfo.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "جاري تحميل بيانات الطالب",
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
              )
            : Stack(children: [
                Container(color: Colors.white),
                Center(
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    color: Colors.white.withOpacity(0.07),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
                ListView(
                  children: [
                    Column(children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 1),
                        height: 150,
                        width: 200,
                        child: Image.asset(
                          "assets/images/person.png",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StudentInfoItem(
                          infoData: studentinfo['student']['name'],
                          infoColor: Color(0xFF678983),
                          //infoicon: Icons.holiday_village_sharp,
                          infotext: "الاسم"),
                      StudentInfoItem(
                        infoColor: Color(0xFFD5CEA3),
                        // infoicon: Icons.phone,
                        infotext: "الكود",
                        infoData: studentinfo['student']['code'],
                      ),
                      StudentInfoItem(
                        infoColor: Color(0xFF678983),
                        // infoicon: Icons.email,
                        infotext: "الإيميل",
                        infoData: studentinfo['student']['email'],
                      ),
                      StudentInfoItem(
                          infoData: studentinfo['student']['nid'],
                          infoColor: Color(0xFFD5CEA3),
                          //    infoicon: Icons.person,
                          infotext: "الرقم القومي"),
                      StudentInfoItem(
                          infoData: studentinfo['student']['phone1'],
                          infoColor: Color(0xFF678983),
                          //  infoicon: Icons.timeline,
                          infotext: "تليفون"),
                      StudentInfoItem(
                          infoData: studentinfo['student']['address'],
                          infoColor: Color(0xFFD5CEA3),
                          //    infoicon: Icons.confirmation_num_outlined,
                          infotext: "العنوان"),
                      StudentInfoItem(
                          infoData: studentinfo['student']['nationality'],
                          infoColor: Color(0xFF678983),
                          //       infoicon: Icons.numbers_rounded,
                          infotext: "الجنسية"),
                      StudentInfoItem(
                          infoData: studentinfo['student']['birthGovernorate'],
                          infoColor: Color(0xFFD5CEA3),
                          //    infoicon: Icons.confirmation_num_outlined,
                          infotext: "مكان الميلاد"),
                      StudentInfoItem(
                          infoData: studentinfo['student']['birthDate'],
                          infoColor: Color(0xFF678983),
                          //      infoicon: Icons.person,
                          infotext: " تاريخ الميلاد"),
                    ])
                  ],
                )
              ]));
  }

  Future fetchStudentInfo() async {
    Uri goUri = Uri.parse(
        'https://erp.thiet.edu.eg/api/student/login?email=${LoginScreen.emailController.text}&password=${LoginScreen.passwordController.text}');

    var respnse = await http.get(goUri);
    final data = json.decode(respnse.body);
    setState(() {
      studentinfo.addAll(data);
    });
    print(studentinfo);
  }
}
