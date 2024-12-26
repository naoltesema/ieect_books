import 'package:flutter/material.dart';
import 'package:ieect_books/pages/pdf_list.dart';

class LevelPage extends StatelessWidget {
  final List<String> levels = ['Level 2', 'Level 3', 'Level 4', 'Level 5'];

  LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.white,
        title: const Text(
          'Select Level',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: levels.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey[900],
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
