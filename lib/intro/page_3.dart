import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 204, 208, 210),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your own asset image or use an Icon
            const Icon(
              Icons.done_all,
              size: 100,
              color: Color.fromARGB(255, 4, 4, 4),
            ),
            const SizedBox(height: 40),
            const Text(
              'Get Started Now',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 7, 7, 7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your personalized app experience starts here. Let’s get started!',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(179, 5, 5, 5),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
