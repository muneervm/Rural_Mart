import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Screens/Home_screens/Cart/custom_card.dart';
import 'package:grocery_app/Screens/Home_screens/Checkout/payment.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        leadingWidth: SizeConfig.screenWidth * 0.19,

        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        toolbarHeight: SizeConfig.blockHeight * 8,
        title: Text(
          'My Cart',
          style: GoogleFonts.poppins(
            fontSize: SizeConfig.blockHeight * 2.5,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 14, 98, 17),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.blockHeight * 1.2),
            SizedBox(
              height: SizeConfig.blockHeight * 37,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.blockHeight * 1),
                    cartCard(
                      imageUrl: 'assets/dummyimage/strawberry.png',
                      itemName: 'Strawberry',
                      itemPrice: '₹200.00',
                      itemWeight: '250gm',
                    ),
                    cartCard(
                      imageUrl: 'assets/dummyimage/vegs/beetroot.png',
                      itemName: 'Beetroot Red',
                      itemPrice: '₹40.00',
                      itemWeight: '1kg',
                    ),
                    cartCard(
                      imageUrl: 'assets/dummyimage/avacado.png',
                      itemName: 'Avacado',
                      itemPrice: '₹200.00',
                      itemWeight: '1kg',
                    ),
                    cartCard(
                      imageUrl: 'assets/dummyimage/apple.png',
                      itemName: 'Apple',
                      itemPrice: '₹60.00',
                      itemWeight: '1kg',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 2),
            Container(
              height: SizeConfig.blockHeight * 7.5,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),

              margin: EdgeInsets.symmetric(horizontal: 0),

              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockHeight * 1.5,
                  horizontal: SizeConfig.blockWidth * 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: SizeConfig.blockWidth * 10,
                            height: SizeConfig.blockWidth * 10,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.percent,
                              color: const Color.fromARGB(255, 5, 143, 47),
                              size: SizeConfig.blockWidth * 5.5,
                            ),
                          ),

                          SizedBox(width: SizeConfig.blockWidth * 3),

                          Text(
                            'Apply a promo code',
                            style: TextStyle(
                              fontSize: SizeConfig.blockWidth * 4.2,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        print('Promo code applied!');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 5, 143, 47),
                        foregroundColor: Colors.white,
                        minimumSize: Size(
                          SizeConfig.blockWidth * 25,
                          SizeConfig.blockHeight * 5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.blockWidth * 3,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockWidth * 5,
                        ),
                      ),
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          fontSize: SizeConfig.blockWidth * 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 1),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockHeight * 2,
                horizontal: SizeConfig.blockWidth * 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal :",
                        style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockWidth * 3.8,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "₹500.00",
                        style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockWidth * 4,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1.5),
                  Divider(thickness: 1, color: Colors.grey.shade300),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery :",
                        style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockWidth * 3.8,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "₹20.00",
                        style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockWidth * 4,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1.5),
                  Divider(thickness: 1, color: Colors.grey.shade300),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Cost :",
                        style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockWidth * 4,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "₹520.00",
                        style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockWidth * 4.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 1.5),
            Center(
              child: SizedBox(
                width: SizeConfig.blockWidth * 85,
                height: SizeConfig.blockHeight * 5.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 5, 143, 47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          height: SizeConfig.blockHeight * 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: SizeConfig.blockHeight * 0.9,
                                  width: SizeConfig.blockWidth * 15,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      5,
                                      143,
                                      47,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              SizedBox(height: SizeConfig.blockHeight * 3),

                              Text(
                                'Order Confirmation',
                                style: GoogleFonts.poppins(
                                  fontSize: SizeConfig.blockHeight * 2.2,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(255, 14, 98, 17),
                                ),
                              ),
                              SizedBox(height: SizeConfig.blockHeight * 4),

                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Delivery Address',
                                      style: GoogleFonts.poppins(
                                        fontSize: SizeConfig.blockHeight * 1.8,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                          255,
                                          14,
                                          98,
                                          17,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockHeight * 1.5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/Icons/delivery.png',
                                          height: SizeConfig.blockHeight * 5,
                                          width: SizeConfig.blockWidth * 8,
                                        ),
                                        SizedBox(
                                          width: SizeConfig.blockWidth * 6,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Chennai Mg street,near nayarambalam',
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                                  SizeConfig.blockHeight * 1.5,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.edit,
                                            color: const Color.fromARGB(
                                              255,
                                              14,
                                              98,
                                              17,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: SizeConfig.screenHeight * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery time:',
                                    style: GoogleFonts.poppins(
                                      fontSize: SizeConfig.screenWidth * 0.04,
                                    ),
                                  ),
                                  Text(
                                    '15–20 min',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery services:',
                                    style: GoogleFonts.poppins(
                                      fontSize: SizeConfig.screenWidth * 0.04,
                                    ),
                                  ),
                                  Text(
                                    '₹20.00',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                ],
                              ),
                              const Divider(height: 30, color: Colors.black12),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total:',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '₹520.00',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),

                              const Spacer(),

                              Center(
                                child: SizedBox(
                                  width: SizeConfig.blockWidth * 85,
                                  height: SizeConfig.blockHeight * 5.5,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        5,
                                        143,
                                        47,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Payment(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Make Payment',
                                      style: GoogleFonts.poppins(
                                        fontSize: SizeConfig.blockHeight * 1.8,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },

                  child: Text(
                    "Checkout Now",
                    style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockHeight * 1.8,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
