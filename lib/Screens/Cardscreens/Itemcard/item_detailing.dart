import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Screens/Home_screens/botttom_nav.dart';

// ignore: must_be_immutable
class ItemDetailScreen extends StatefulWidget {
  final String title;
  final String price;
  final String imagePath;
  final String? descript;
  String? weight;

  ItemDetailScreen({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    this.descript,
    this.weight,
  });

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int quantity = 1;

  void increment() => setState(() => quantity++);
  void decrement() => setState(() => quantity > 1 ? quantity-- : quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Details',
          style: GoogleFonts.poppins(
            fontSize: SizeConfig.blockHeight * 2.5,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 14, 98, 17),
          ),
        ),

        toolbarHeight: SizeConfig.blockHeight * 8,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: SizeConfig.blockHeight * 2.9,
            weight: SizeConfig.blockWidth * 5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.blockHeight * 4),
            Center(
              child: Container(
                height: SizeConfig.blockHeight * 40,

                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(widget.imagePath, fit: BoxFit.contain),
              ),
            ),

            SizedBox(height: SizeConfig.blockHeight * 2.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockHeight * 2.6,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  widget.price,
                  style: GoogleFonts.poppins(
                    fontSize: SizeConfig.blockHeight * 2.4,
                    color: const Color.fromARGB(255, 5, 143, 47),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.blockHeight * 1.6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.weight ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: SizeConfig.blockHeight * 1.8,
                    color: Colors.black26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: SizeConfig.blockHeight * 2.5,
                    ),
                    SizedBox(width: SizeConfig.blockWidth * 1.6),
                    Text(
                      "4.5",
                      style: TextStyle(
                        fontSize: SizeConfig.blockHeight * 2,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: SizeConfig.blockHeight * 1.6),

            Text(
              "Description",
              style: GoogleFonts.poppins(
                fontSize: SizeConfig.blockHeight * 2.2,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 1.6),
            Text(
              widget.descript ?? '',
              style: GoogleFonts.poppins(
                fontSize: SizeConfig.blockHeight * 1.75,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: SizeConfig.blockHeight * 4),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: SizeConfig.blockHeight * 5.4,
                  width: SizeConfig.blockWidth * 32,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, color: Colors.black),
                        iconSize: SizeConfig.blockHeight * 2.2,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: decrement,
                      ),

                      Text(
                        quantity.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        iconSize: 18,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: increment,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockHeight * 5.4,
                  width: SizeConfig.blockWidth * 53,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          backgroundColor: Color.fromARGB(255, 5, 143, 47),
                          content: Center(
                            child: Text(
                              'Item added to Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 5, 143, 47),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Add To Cart",
                      style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockHeight * 1.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
