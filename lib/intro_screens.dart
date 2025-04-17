import 'package:ditto_app/intro/page_1.dart';
import 'package:ditto_app/intro/page_2.dart';
import 'package:ditto_app/intro/page_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './home.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  bool lastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                lastPage = (index == 2);
              });
            },
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 10,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  lastPage ? SizedBox.shrink() : GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      'skip',
                      style: TextStyle(fontSize: 15,
                        color: Colors.white,
                        ),
                      )
                  ),
                  // Dot indicator
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: Colors.blueAccent,
                    ),
                  ),
                  lastPage ? SizedBox.shrink() : GestureDetector(
                    onTap: () {
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: Text(
                      'next',
                      style: TextStyle(fontSize: 15,
                        color: Colors.white,
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
          if (lastPage)
            Positioned(
              bottom: 20,
              left: 40,
              right: 40,
              child: ElevatedButton(
                onPressed: goToHomePage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 27, 27, 27),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18,
                  color: Colors.white,
                  ),
                  
                ),
              ),
            ),
        ],
      ),
    );
  }
}
