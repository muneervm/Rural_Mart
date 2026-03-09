import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentOptionRow extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  const PaymentOptionRow({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          children: [
            Image.asset(iconPath, height: 25, width: 25),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
