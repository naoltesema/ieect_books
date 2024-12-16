import 'package:flutter/material.dart';
import 'package:ieect_books/pages/pdf_list.dart';

class LevelPage extends StatelessWidget {
  final List<String> levels = ['Level 1', 'Level 2', 'Level 3', 'Level 4'];

  LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Select Level',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: levels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              levels[index],
              style: const TextStyle(color: Colors.white),
            ),
            trailing: const Icon(Icons.arrow_forward, color: Colors.white),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfListScreen(level: levels[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
