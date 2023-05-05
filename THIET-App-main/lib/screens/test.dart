import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});
  static const routeName = "/test-screen";

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "سيتم إنشاء هذه الصفحه قريبا ",
        style: Theme.of(context).textTheme.headline2,
      )),
    );
  }
  
}
