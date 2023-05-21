import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:thiet_v2/widgets/main_drawer.dart';
import 'package:thiet_v2/widgets/pdf_view.dart';

class SubjectDetailsScreen extends StatefulWidget {
  const SubjectDetailsScreen({super.key});
  static const routeName = '/subject-details-screen';

  @override
  State<SubjectDetailsScreen> createState() => _SubjectDetailsScreenState();
}

class _SubjectDetailsScreenState extends State<SubjectDetailsScreen> {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  File? selectedFile;
  String? fileName;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          "اسم المادة",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                          color: Theme.of(context).primaryColor,
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
                        onTap: () {
                        Navigator.pushNamed(context, PdfView.routeName);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 40),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Text(
                        "يمكنك رفع و تسليم الشيتات هنا ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Card(
                      elevation: 6,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .12,
                        width: MediaQuery.of(context).size.width * .87,
                        child: SizedBox(
                          child: fileName != null
                              ? Center(
                                  child: Text(fileName!),
                                )
                              : Center(
                                  child:
                                      selectedFile == null && fileName == null
                                          ? Image.asset(
                                              "assets/images/upload_cloud.png",
                                              alignment: Alignment.center,
                                              width: 50,
                                              height: 50,
                                              //  MediaQuery.of(context).size.width * 1
                                            )
                                          : Image.file(selectedFile!),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          elevation: 6,
                          child: TextButton.icon(
                              onPressed: () {
                                pickFileFromDevice();
                              },
                              icon: Icon(
                                Icons.upload_file_rounded,
                                color: Theme.of(context).primaryColor,
                              ),
                              label: Text(
                                "upload file",
                                style: Theme.of(context).textTheme.headline2,
                              )),
                        ),
                        Card(
                          elevation: 6,
                          child: TextButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.done,
                                color: Colors.green,
                              ),
                              label: Text(
                                "Done",
                                style: Theme.of(context).textTheme.headline2,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickFileFromDevice() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);
    if (result != null) {
      PlatformFile file = result.files.first;
      if (file.extension == 'jpg' ||
          file.extension == 'jpeg' ||
          file.extension == 'png' ||
          file.extension == 'gif') {
        setState(() {
          fileName = null;
          selectedFile = selectedFile = File(result.files.single.path!);
        });
      } else if (file.extension == 'pdf') {
        setState(() {
          fileName = file.name;
        });
      }
    } else {}
  }
}
