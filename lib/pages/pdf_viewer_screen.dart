import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerScreen extends StatefulWidget {
  final String pdfPath;

  const PdfViewerScreen({super.key, required this.pdfPath});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  int totalPageCount = 0, currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<PdfDocument>(
        future: PdfDocument.openAsset(widget.pdfPath),  // Load PDF asynchronously
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final pdfControllerPinch = PdfControllerPinch(
              document: snapshot.hasData,  // Use the loaded PDF document
            );
            return Column(
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
            );
          }
          return const Center(child: Text('No Data'));
        },
      ),
    );
  }
}
