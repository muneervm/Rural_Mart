import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leadingWidth: SizeConfig.screenWidth * 0.19,

        backgroundColor: Colors.white,

        centerTitle: true,
        toolbarHeight: SizeConfig.blockHeight * 8,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: SizeConfig.blockHeight * 2.5,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 14, 98, 17),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.blockHeight * 5),

            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            "assets/login_images/person.png",
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Selvaraj",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "customer",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: SizeConfig.blockHeight * 2),

            SingleChildScrollView(
              child: Column(
                children: [
                  buildMenuItem(
                    "Email :",
                    () {},
                    'selva@gmail.com',
                    Icons.email,
                  ),

                  buildMenuItem("Phone :", () {}, '9685748574', Icons.phone),

                  buildMenuItem(
                    "Address :",
                    () {},
                    'santhinagar (H) thiruchirapilly',
                    Icons.dataset_rounded,
                  ),
                  buildMenuItem("DOB :", () {}, '13-02-1985', Icons.date_range),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 4),

            SizedBox(
              width: SizeConfig.blockWidth * 85,
              height: SizeConfig.blockHeight * 5.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 143, 47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Edit",
                  style: GoogleFonts.poppins(
                    fontSize: SizeConfig.blockHeight * 1.8,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
    String title,
    VoidCallback onTap,
    String subtitle,
    IconData leadingIcon,
  ) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
          ),

          child: Icon(leadingIcon, size: 20, color: Colors.black),
        ),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 4.0),

            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
