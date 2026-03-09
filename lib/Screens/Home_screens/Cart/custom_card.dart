import 'package:flutter/material.dart';
import 'package:grocery_app/Commonwidgets/Customquantity/quantity_controllbutton.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';

class cartCard extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final String itemWeight;
  final String itemPrice;

  const cartCard({
    Key? key,
    required this.imageUrl,
    required this.itemName,
    required this.itemWeight,
    required this.itemPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,

      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(horizontal: 0.1, vertical: 3.5),
      child: Padding(
        padding: const EdgeInsets.all(7.5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: SizeConfig.blockWidth * 23,
              height: SizeConfig.blockWidth * 19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),

                child: Image.asset(imageUrl, fit: BoxFit.contain),
              ),
            ),

            SizedBox(width: SizeConfig.blockWidth * 5),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(
                          fontSize: SizeConfig.blockWidth * 3.5,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        height: SizeConfig.blockHeight * 0.45,

                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: SizeConfig.blockWidth * 4.4,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            print('Remove item: $itemName');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 0.40),

                  Text(
                    itemWeight,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockWidth * 2.9,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1.4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemPrice,
                        style: TextStyle(
                          fontSize: SizeConfig.blockWidth * 3.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      QuantityCounter(initialQuantity: 1),
                    ],
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
