import 'package:flutter/material.dart';
import 'pdf_viewer_screen.dart';

class PdfListScreen extends StatelessWidget {
  final String level;
  PdfListScreen({super.key, required this.level});

  // List of PDFs for each level
  final Map<String, List<String>> pdfPathsByLevel = {
    'Level1': [
      'assets/pdf/level1/M01.pdf',
      'assets/pdf/level1/M02.pdf',
      'assets/pdf/level1/M03.pdf',
    ],
    'Level2': [
      'assets/pdf/level2/M01.pdf',
      'assets/pdf/level2/M02.pdf',
      'assets/pdf/level2/M03.pdf',
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

  @override
  Widget build(BuildContext context) {
    // Get the list of PDFs for the selected level
    List<String> pdfPaths = pdfPathsByLevel[level] ?? ['No PDFs available'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Books for $level'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: pdfPaths.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
            title: Text('Document ${index + 1}'),
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
