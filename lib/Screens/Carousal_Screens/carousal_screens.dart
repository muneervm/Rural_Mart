import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Screens/Login_Screen/Login/login_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousal1 extends StatefulWidget {
  const Carousal1({super.key});

  @override
  State<Carousal1> createState() => _Carousal1State();
}

class _Carousal1State extends State<Carousal1> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _goToLogin() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  Widget buildPage({
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12 * SizeConfig.blockHeight),

        // Image
        Container(
          height: 35 * SizeConfig.blockHeight,
          width: double.infinity,
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),

        SizedBox(height: 5.5 * SizeConfig.blockHeight),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * SizeConfig.blockWidth),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 3 * SizeConfig.blockHeight,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),

        SizedBox(height: 2.2 * SizeConfig.blockHeight),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * SizeConfig.blockWidth),
          child: Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 1.5 * SizeConfig.blockHeight,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
            ),
          ),
        ),

        SizedBox(height: 5 * SizeConfig.blockHeight),

        Center(
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const WormEffect(
              dotHeight: 7,
              dotWidth: 16,
              activeDotColor: Color.fromARGB(255, 5, 143, 47),
              dotColor: Colors.black26,
            ),
          ),
        ),

        SizedBox(height: 12 * SizeConfig.blockHeight),

        Center(
          child: SizedBox(
            width: SizeConfig.blockWidth * 85,
            height: SizeConfig.blockHeight * 5.5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 5, 143, 47),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (currentPage == 2) {
                  _goToLogin();
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                currentPage == 2 ? "GET STARTED" : "NEXT",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 2 * SizeConfig.blockHeight),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() => currentPage = index);
        },
        children: [
          buildPage(
            title: "Get groceries at your\ndoorstep",
            subtitle:
                "Order from anywhere, and we’ll deliver\nyour groceries quickly and safely to your home.",
            imagePath: 'assets/carousal_images/carousal1.png',
          ),
          buildPage(
            title: "Save time,\nsave money",
            subtitle:
                "Shop smarter with exclusive deals, fresh products,\nand fast delivery at your convenience.",
            imagePath: 'assets/carousal_images/carousal2.png',
          ),
          buildPage(
            title: "Fresh Items with\nfast delivery groceries",
            subtitle:
                "We try our best to make sure our customers are happy with fresh grocery items.",
            imagePath: 'assets/carousal_images/carousal3.png',
          ),
        ],
      ),
    );
  }
}
