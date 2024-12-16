import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerScreen extends StatefulWidget {
  final String pdfPath;

  const PdfViewerScreen({super.key, required this.pdfPath});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  late PdfControllerPinch pdfControllerPinch;
  int totalPageCount = 0, currentPage = 1;

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openAsset(widget.pdfPath),
    );
  }

  @override
  void dispose() {
    pdfControllerPinch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total Pages: $totalPageCount"),
              const SizedBox(width: 20),
              Text("Current Page: $currentPage"),
            ],
          ),
          Expanded(
            child: PdfViewPinch(
              controller: pdfControllerPinch,
              onDocumentLoaded: (doc) {
                setState(() {
                  totalPageCount = doc.pagesCount;
                });
              },
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                }); 
              },
            ),
          ),
        ],
      ),
    );
  }
}
