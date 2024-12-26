import 'package:flutter/material.dart';
import 'package:ieect_books/components/my_button.dart';
import 'package:ieect_books/pages/level_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              const Spacer(flex: 2),
              const Text(
                'Welcome to Ambo Technic College\nElectrical Department',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20, // Added font size for better visibility
                  fontWeight: FontWeight.bold, // Makes the text stand out
                ),
              ),
              const Spacer(flex: 3),
              MyButton(
                buttonText: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LevelPage(),
                    ),
                  );
                },
              ),
              const Spacer(flex: 1),
              const Text(
                "Made with ❤️ by Naol Tesema",
                style: TextStyle(
                    fontSize: 10, color: Color.fromARGB(255, 160, 158, 158)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
