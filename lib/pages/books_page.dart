import 'package:flutter/material.dart';
import 'package:ieect_books/pages/pdf_list.dart';
import '../components/my_button.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> levels = [
      'Level 1',
      'Level2',
      'Level 3',
      'Level 4',
      'Level 5',
      'Level 6',
      'Level 7',
      'Level 8',
      'Level 9',
      'Level 10',
      'Level 11'
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Select a Book Level',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: ListView.builder(
          itemCount: levels.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                MyButton(
                  buttonText: levels[index],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PdfListScreen(level: levels[index]),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
