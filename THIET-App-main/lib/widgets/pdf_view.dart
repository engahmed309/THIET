import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';


class PdfView extends StatefulWidget {
  const PdfView({super.key});
static const String routeName = "/pdf-view";
  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {int? pages = 0;

  bool isReady = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PDFView(
  filePath: "assets/pdf/exams.pdf",
  enableSwipe: true,
  swipeHorizontal: true,
  autoSpacing: false,
  pageFling: false,
  onRender: (_pages) {
    setState(() {
      pages = _pages;
      isReady = true;
    });
  },
  onError: (error) {
    print(error.toString());
  },
  onPageError: (page, error) {
    print('$page: ${error.toString()}');
  },
  onViewCreated: (PDFViewController pdfViewController) {
 //_controller.complete(pdfViewController);
  },
  onPageChanged: (int ?page, int? total) {
    print('page change: $page/$total');
  },
),);
  }
}