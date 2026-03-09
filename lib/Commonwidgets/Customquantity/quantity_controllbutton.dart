import 'package:flutter/material.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';

class QuantityCounter extends StatefulWidget {
  final ValueChanged<int>? onQuantityChanged;
  final int initialQuantity;

  const QuantityCounter({
    Key? key,
    this.initialQuantity = 1,
    this.onQuantityChanged,
  }) : super(key: key);

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity.clamp(1, 99);
  }

  void _updateQuantity(int delta) {
    if (_quantity + delta < 1) return;

    setState(() {
      _quantity += delta;
      if (widget.onQuantityChanged != null) {
        widget.onQuantityChanged!(_quantity);
      }
    });
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color foregroundColor,
  }) {
    final size = SizeConfig.blockWidth * 6.5;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(size / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(size / 2),
          border: Border.all(
            color: backgroundColor == Colors.white
                ? Colors.grey.shade300
                : Colors.transparent,
            width: 1.0,
          ),
        ),
        child: Icon(
          icon,
          size: SizeConfig.blockWidth * 4.5,
          color: foregroundColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildControlButton(
            icon: Icons.remove,
            onPressed: () => _updateQuantity(-1),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockWidth * 2.5,
            ),
            child: Text(
              '$_quantity',
              style: TextStyle(
                fontSize: SizeConfig.blockWidth * 4,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _buildControlButton(
            icon: Icons.add,
            onPressed: () => _updateQuantity(1),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
