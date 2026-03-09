class Item {
  final String title;
  final String imagePath;
  final double imageHeight;
  final String price;
  final String weight;
  String? description;

  Item({
    required this.title,
    required this.imagePath,
    required this.imageHeight,
    required this.price,
    required this.weight,
    this.description,
  });
}
