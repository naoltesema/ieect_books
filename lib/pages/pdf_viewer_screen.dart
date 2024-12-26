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
    // Initialize the PDF controller with the given document path
    pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openAsset(widget.pdfPath),
    );
  }

  @override
  void dispose() {
    pdfControllerPinch.dispose(); // Dispose of the controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Pages $totalPageCount",
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 40),
                Text(
                  "Current Page $currentPage",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
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
