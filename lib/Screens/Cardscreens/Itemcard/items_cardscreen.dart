import 'package:flutter/material.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Screens/Cardscreens/Itemcard/item_detailing.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final String price;
  final String weight;
  final VoidCallback onAddToCart;
  String? description;

  CustomCard({
    Key? key,
    required this.title,
    required this.imagePath,
    this.description,
    required this.price,
    required this.weight,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(
              title: widget.title,
              price: widget.price,
              imagePath: widget.imagePath,
              descript: widget.description,
              weight: widget.weight,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.5),
              child: Container(
                height: SizeConfig.blockHeight * 12,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(widget.imagePath, fit: BoxFit.contain),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.blockHeight * 1),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: SizeConfig.blockHeight * 2,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavourite = !isFavourite;
                              if (isFavourite) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.red,
                                    content: Center(
                                      child: Text(
                                        'Item added to favourites',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.red,
                                    content: Center(
                                      child: Text(
                                        'Item removed from favourites',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              ;
                            });
                          },
                          child: Icon(
                            Icons.favorite,
                            size: SizeConfig.blockHeight * 2.4,
                            color: isFavourite ? Colors.red : Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 0.8),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.price,
                    style: TextStyle(
                      fontSize: SizeConfig.blockHeight * 2.1,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onAddToCart,
                    child: Container(
                      height: SizeConfig.blockHeight * 3,
                      width: SizeConfig.blockHeight * 3,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 5, 143, 47),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: SizeConfig.blockHeight * 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
