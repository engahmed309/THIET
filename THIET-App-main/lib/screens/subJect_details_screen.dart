import 'package:flutter/material.dart';
import 'package:thiet_v2/widgets/main_drawer.dart';

class SubjectDetailsScreen extends StatelessWidget {
  const SubjectDetailsScreen({super.key});
  static const routeName = '/subject-details-screen';
  @override
  Size get preferredSize => const Size.fromHeight(50);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.indigo[100],
        centerTitle: true,
        title: Text(
          "اسم المادة",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Colors.white),
            Center(
              child: Image.asset(
                "assets/images/logo.jpg",
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.07),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.indigo[100],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          // bottomRight: Radius.circular(100),
                        )),
                    child: Text(
                      "/دكتور المادة",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 10,
                    child: ListTile(
                      leading: Icon(
                        Icons.picture_as_pdf,
                        color: Colors.red,
                      ),
                      trailing: Text(
                        "امتحانات الأعوام السابقة",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      "يمكنك رفع و تسليم الشيتات هنا ",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 6,
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.upload_file_rounded,
                          color: Colors.indigo[300],
                        ),
                        label: Text(
                          "upload pdf file",
                          style: Theme.of(context).textTheme.headline2,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
