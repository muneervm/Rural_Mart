import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        toolbarHeight: SizeConfig.blockHeight * 8,
        title: Text(
          'Favourites',
          style: GoogleFonts.poppins(
            fontSize: SizeConfig.blockHeight * 2.5,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 14, 98, 17),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockWidth * 4.5,
          vertical: SizeConfig.blockHeight * .30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/dummyimage/cart.png",
                height: SizeConfig.blockHeight * 20,
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 0.1),
            Text(
              "No Favourites Here",
              style: TextStyle(
                fontSize: SizeConfig.blockHeight * 2,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 1),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockHeight * 5,
              ),
              child: Text(
                "Fill up your fav with your liked products. Start shopping now!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeConfig.blockHeight * 1.8,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 1.8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.black12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 3,
                  vertical: SizeConfig.blockHeight * 1,
                ),
              ),
              child: const Text(
                "View trending items",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
