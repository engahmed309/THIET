import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:thiet_v2/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:thiet_v2/screens/student_info_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const routeName = "/login-screen";
  static var emailController = TextEditingController();
  static var passwordController = TextEditingController();
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

//   String? email;
//  String? password ;
  Uri baseAuthUrl = Uri.parse('https://erp.thiet.edu.eg/api/student/login');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          SizedBox(
            height: 150,
          ),
          Text("WELCOME TO THIET",style: Theme.of(context).textTheme.headline2,),
          Container(
            child: Center(
                child: Image.asset(
              "assets/images/logo.jpg",
              height: 200,
              width: 200,
            )),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    LoginScreen.emailController.text = value;
                    // print(value);
                    print(LoginScreen.emailController.text);
                  },
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "ElMessiri",
                      fontSize: 20),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColor,
                      ),
                      label: Text('البريد الالكتروني'),
                      border: OutlineInputBorder()),
                  mouseCursor: MouseCursor.defer,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    LoginScreen.passwordController.text = value;

                    print(LoginScreen.passwordController.text);
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "ElMessiri",
                  ),
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: !_obscureText
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      label: Text('كلمة المرور'),
                      border: OutlineInputBorder()),
                ),
              ],
            )),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            hoverColor: Colors.cyan,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              print(LoginScreen.emailController.text);
              print(LoginScreen.passwordController.text);
              login();
            },
            child: Text(
              " تسجيل الدخول ",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> login() async {
    var response = await http.post(baseAuthUrl,
        body: ({
          'email': LoginScreen.emailController.text,
          'password': LoginScreen.passwordController.text
        }));
    if (response.statusCode == 200) {
      Uri dataAuthUrl = Uri.parse(
          'https://erp.thiet.edu.eg/api/student/login?email=${LoginScreen.emailController.text}&password=${LoginScreen.passwordController.text}');
print(dataAuthUrl);
      // var decode = json.decode(response.body);
     // print(decode);
      Navigator.pushNamed(context, HomeScreen.routeName,
          arguments: dataAuthUrl);
      AwesomeDialog(
              title: "تم تسجيل الدخول بنجاح",
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              width: 1800)
          .show();
    } else {
      AwesomeDialog(
              title: "خطأ في إدخال بيانات الاعتماد حاول مرة أخرى",
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              width: 1800)
          .show();
    }
  }
}
// var requestUrl =
//         (ModalRoute.of(context)?.settings.arguments ?? <dynamic>[]) ;
//         print("data is $requestUrl");