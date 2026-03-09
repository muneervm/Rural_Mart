import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';

class CommonSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final ValueChanged<String>? onChanged;

  const CommonSearchBar({
    Key? key,
    required this.controller,
    this.hintText = "",
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,

            height: SizeConfig.blockHeight * 6,
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockWidth * 4,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/Icons/search.png",
                  height: SizeConfig.blockHeight * 2,
                  width: SizeConfig.blockHeight * 3,
                  color: Color.fromARGB(255, 114, 113, 113),
                ),
                SizedBox(width: SizeConfig.blockWidth * 2.5),
                Expanded(
                  child: TextField(
                    style: GoogleFonts.poppins(color: Colors.black),
                    controller: controller,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 114, 114, 114),
                        fontSize: SizeConfig.blockHeight * 1.6,
                        fontWeight: FontWeight.w700,
                      ),
                      hintText: hintText,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
