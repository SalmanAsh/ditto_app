import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 90, 93, 95),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your own asset image or use an Icon
            const Icon(
              Icons.start,
              size: 100,
              color: Color.fromARGB(255, 199, 193, 193),
            ),
            const SizedBox(height: 40),
            const Text(
              'Find Your Next Holiday Destination',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your personalized app experience starts here. Let’s get started!',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(179, 197, 195, 195),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
