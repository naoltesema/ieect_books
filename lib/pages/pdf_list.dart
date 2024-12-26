import 'package:flutter/material.dart';
import 'pdf_viewer_screen.dart';

class PdfListScreen extends StatelessWidget {
  final String level;

  PdfListScreen({super.key, required this.level});

  // List of PDFs for each level
  final Map<String, List<String>> pdfPathsByLevel = {
    'Level 2': [
      'assets/pdf/level2/M01.pdf',
      'assets/pdf/level2/M02.pdf',
      'assets/pdf/level2/M03.pdf',
      'assets/pdf/level2/M04.pdf',
      'assets/pdf/level2/M05.pdf',
      'assets/pdf/level2/M06.pdf',
      'assets/pdf/level2/M07.pdf',
      'assets/pdf/level2/M08.pdf',
      'assets/pdf/level2/M09.pdf',
      'assets/pdf/level2/M10.pdf',
      'assets/pdf/level2/M11.pdf',
    ],
    'Level 3': [
      'assets/pdf/level3/M01.pdf',
      'assets/pdf/level3/M02.pdf',
      'assets/pdf/level3/M03.pdf',
    ],
    'Level 4': [
      'assets/pdf/level4/M01.pdf',
      'assets/pdf/level4/M02.pdf',
      'assets/pdf/level4/M03.pdf',
    ],
  };

  String getFileName(String path) {
    // Extract the file name without the extension
    return path.split('/').last.split('.').first;
  }

  @override
  Widget build(BuildContext context) {
    // Get the list of PDFs for the selected level
    List<String> pdfPaths = pdfPathsByLevel[level] ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          ' $level Books',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: pdfPaths.isEmpty
          ? const Center(child: Text('No PDFs available for this level'))
          : ListView.builder(
              itemCount: pdfPaths.length,
              itemBuilder: (context, index) {
                final pdfName =
                    getFileName(pdfPaths[index]); // Get the file name
                return ListTile(
                  leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                  title: Text(pdfName), // Use the file name as the title
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PdfViewerScreen(pdfPath: pdfPaths[index]),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
