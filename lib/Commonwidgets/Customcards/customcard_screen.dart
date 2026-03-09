import 'package:flutter/material.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const ItemCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: SizeConfig.blockWidth * 18,
            height: SizeConfig.blockHeight * 6.1,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: SizeConfig.blockHeight * 0.6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.blockHeight * 1.4,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
