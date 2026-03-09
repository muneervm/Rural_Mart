import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Custompaymentmodes/paymentmode.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Colors.white,

        centerTitle: true,
        toolbarHeight: SizeConfig.blockHeight * 8,
        title: Text(
          'Proceed Payment',
          style: GoogleFonts.poppins(
            fontSize: SizeConfig.blockHeight * 2.5,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 14, 98, 17),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Select Payment Method',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 5),

            PaymentOptionRow(
              title: 'Credit / Debit Card',
              iconPath: 'assets/Icons/atm-card.png',
            ),
            SizedBox(height: SizeConfig.blockHeight * 2),
            PaymentOptionRow(
              title: 'PayPal',
              iconPath: 'assets/Icons/paypal.png',
            ),
            SizedBox(height: SizeConfig.blockHeight * 2),
            PaymentOptionRow(
              title: 'Google Pay',
              iconPath: 'assets/login_images/google.png',
            ),
            SizedBox(height: SizeConfig.blockHeight * 2),
            PaymentOptionRow(
              title: 'Apple Pay',
              iconPath: 'assets/Icons/apple.png',
            ),
            SizedBox(height: SizeConfig.blockHeight * 2),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                ),
                Text('or', style: TextStyle(color: Colors.black)),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockHeight * 2),

            PaymentOptionRow(
              title: 'Cash on Delivery',
              iconPath: 'assets/Icons/delivery-bike.png',
            ),
            SizedBox(height: SizeConfig.blockHeight * 5),
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
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Payment()),
                    );
                  },
                  child: Text(
                    'Proceed To Pay',
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
